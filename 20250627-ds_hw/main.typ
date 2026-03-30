#show math.equation.where(block: false): it => math.display(it)
#set text(font: "Source Han Serif SC")
#set heading(numbering: "1.")
#show heading.where(level: 1): it => [#it #v(0.5em)]
#set par(first-line-indent: (amount: 1.5em, all: true))
#show raw: it => figure(rect(text(size: 8pt, it), stroke: 0.5pt, inset: (x: 2em, y: 1em)))

#align(center)[
  #[
    #set par(spacing: 15pt)
    #text(size: 20pt, weight: "bold")[
      VAE 实现与条件生成
    ]

    人工智能原理与技术 / 课程作业
  ]

  #columns(3)[
    ???

    ???
    #colbreak()

    ???

    ???
    #colbreak()

    ???

    ???
  ]
  #v(30pt)

  #align(left)[
    *摘要：*本文主要探讨了变分自编码器（VAE）的实现与条件生成的相关技术，详细讨论了 KL 散度，ELBO，以及 VAE 的基本原理，完整回答了作业要求中提出的问题。
    针对作业要求中提出的两个任务（VAE 及条件生成），我们设计了一个带标签的条件变分自编码器（CVAE）来验证相关思路。在通过实验验证方案可行性的同时，我们给出定性、定量的结果分析，并给出我们调整超参数的思路以及发现。

    *关键字：*变分自编码器，条件生成，MINST 数据集
  ]
]

#v(30pt)

= Preliminary / 预备知识

- （0.1 Q1）证明任意两个分布 $p,q$，都有 $D_"KL" (p || q) >= 0$，且当且仅当 $p=q$ 时取等。

  #text(fill: blue)[
    证明：

    $
      D_"KL" (p || q) & = integral p(x) log p(x)/q(x) dif x       \
                      & = integral p(x) - log q(x)/p(x) dif x     \
                      & = bb(E)_(x tilde p(x)) - log q(x)/p(x)    \
                      & >= - log bb(E)_(x tilde p(x)) q(x)/(p(x)) \
                      & = 0
    $

    注意到等号成立当且仅当 $log q(x)/p(x) = C$，此时有 $p(x) prop q(x)$，又因为 $integral p = integral q = 1$，所以有
    $
      p(x) = q(x) quad "a.e." quad
    $

  ]

- （0.1 Q2）推导一下两个一维正态分布（高斯分布）的 KL 散度结果，
  $
    p(x) tilde cal(N)(mu_1, sigma_1^2), quad q(x) tilde cal(N)(mu_2, sigma_2^2)
  $

  #text(fill: blue)[
    $
      &integral p(x) log p(x)/q(x) dif x \
      & = integral (log p(x) - log q(x)) p(x) dif x \
      & = integral[ cancel(-1/2 log(2pi)) - log(sigma_1) - 1/2 ((x-mu_1)/sigma_1)^2 + cancel(1/2 log(2pi)) + log(sigma_2) + 1/2 ((x-mu_2)/sigma_2)^2 ] p(x) dif x \
      &= log (sigma_2/sigma_1) + 1/(2 sigma_2^2) bb(E)_(x tilde p(x)){(x-mu_2)^2} - 1/(2 sigma_1^2) bb(E)_(x tilde p(x)){(x-mu_1)^2}
    $

    考虑
    $
      (x-mu_2)^2=(x-mu_1)^2+2(x-mu_1)(mu_1-mu_2)+(mu_1-mu_2)^2
    $

    有

    $
      D_"KL" (p || q) &= log (sigma_2/sigma_1) + 1/(2 sigma_2^2) bb(E)_(x tilde p(x)){(x-mu_2)^2} - 1/(2 sigma_1^2) bb(E)_(x tilde p(x)){(x-mu_1)^2}\
      &= log(sigma_2/sigma_1) + (sigma_1^2 + (mu_1- mu_2)^2)/(2 sigma_2^2) - 1/2 \
    $
  ]

- （0.2）补充上面的证明，并推导 ELBO 是什么

  #text(fill: blue)[
    $
      L(theta) = log p(x | theta) & = log integral p(x, z | theta) dif z             \
                                  & = log integral q(z) p(x | z, theta) dif z        \
                                  & >= integral q(z) log p(x | z, theta) dif z       \
                                  & = integral q(z) log (p(x, z | theta))/q(z) dif z \
                                  & = "ELBO"
    $

    将 $L(theta)$ 与 ELBO 相减，我们得到：

    $
      L(theta) - "ELBO" & = integral q(z) log p(x | theta) dif z - integral q(z) log (p(x,z | theta))/q(z) dif z \
                        & = integral q(z) log (p(x | theta) q(z))/(p(x, z | theta)) dif z                        \
                        & = integral q(z) log q(z)/(p(z | x, theta)) dif z                                       \
                        & = D_"KL" (q(z) || p(z | x, theta))
    $
  ]

- （1.3）$theta^* = "argmin"_theta D_"KL" (p_"data" || p_theta)$ 推导 $theta^* = "argmax"_theta bb(E)_(x tilde p_"data")[ log p_theta (x)]$

  #text(fill: blue)[
    不难注意到：
    $
      theta^* & = "argmin"_theta D_"KL" (p_"data" || p_theta)                                  \
              & = "argmin"_theta bb(E)_(x tilde p_"data")[ log p_"data" (x) - log p_theta (x)] \
              & = "argmax"_theta bb(E)_(x tilde p_"data")[ log p_theta (x)]
    $
  ]

#pagebreak()

= Methodology / 方法论

在本实验中，我们为 MINST 数据集构建了一个带标签的条件变分自编码器（Conditional Variational Autoencoder，CVAE），核心架构如下：

```python
self.encoder_conv = nn.Sequential(
    nn.Conv2d(1, 32, kernel_size=4, stride=2, padding=1),  # -> [32, 14, 14]
    nn.LeakyReLU(0.2),
    nn.Conv2d(32, 64, kernel_size=4, stride=2, padding=1),  # -> [64, 7, 7]
    nn.LeakyReLU(0.2),
    nn.Flatten()
)
self.encoder_fc = nn.Linear(64 * 7 * 7 + num_classes, latent_dim * 2)

self.decoder = nn.Sequential(
    nn.Linear(latent_dim + num_classes, 64 * 7 * 7),
    nn.Unflatten(1, (64, 7, 7)),
    nn.ConvTranspose2d(64, 32, kernel_size=4, stride=2, padding=1),  # -> [32, 14, 14]
    nn.LeakyReLU(0.2),
    nn.ConvTranspose2d(32, 1, kernel_size=4, stride=2, padding=1),   # -> [1, 28, 28]
    nn.Sigmoid()
)
```

我们利用两个带 LeakyReLU 激活的卷积层，将图像空间尺寸减半两次，同时通道数从 $1$ 变为 $32$ 再变为 $64$。然后，我们将特征图展平并通过一个全连接层，将其映射到潜在空间的均值和对数方差。解码器部分则是一个对称的结构，首先通过全连接层将潜在变量和条件标签映射回特征图，然后通过转置卷积层逐步恢复到原始图像尺寸。

按照实验文档的提示，我们设计了一个可同时用于 VAE 和条件生成的模型。我们首先将标签通过独热编码，与编码器前面卷积层输出的特征向量进行拼接，再通过全连接层映射到潜在空间的均值和对数方差。在解码器的实现中则与之对称，我们将潜在变量和条件标签拼接在一起，逐步恢复到原始图像尺寸。

完整的架构示意图如下：

#figure(image("drawing.png"), caption: [架构示意图])

#pagebreak()

= Experiment / 实验

我们在一台 $8 times 4090$ 的机器上进行实验验证本文所提方法的有效性，训练所用超参数如下：
（注意到我们使用一个模型解决两个任务，因此无需进行分开进行两次训练/推理）

```bash
python train.py --latent_dim 24 --batch-size 512 --epochs 70 --lr 2e-3 --var 1e-2
python inference.py --checkpoint_path VAEwolabel/test/epoch_70.pth
python grade.py
```

- *定量结果：*在 VAEwolabel & Genwithlabel 任务中，本文模型获得了 $"SSIM"=0.882, "MSE"=0.0104, "FID"=3.431$ 的结果。

  ```text
  Calculating MSE score and SSIM score ...
  10000it [00:03, 2944.53it/s]
  Your SSIM score is: 0.8823659732757319, MSE score is: 0.010373037734701728. Total score is: 10
  ********** Genwithlabel **********
  Calculating MSE score , SSIM score and FID score ...
  10000it [00:03, 3044.22it/s]
  Your SSIM score is: 0.8823659732757319, MSE score is: 0.010373037734701728, FID score is: 3.4312054353084656, Total score is: 28.48061479640772
  The result has been saved to grade_result.json!
  ```

- *定性结果：*

  #columns(2)[
    #figure(image("image.png", width: 200pt), caption: [Genwithlabel])
    #colbreak()
    #figure(image("image-1.png", width: 200pt), caption: [VAEwolabel])
  ]

- *分析：*

  考虑到 MINST 数据集的特性（平移、旋转不变性），同时输入维度较小，很自然的联想到使用卷积层学习一些通用特征。并且考虑到本文所提模型设计较为简单，仅使用两层卷积层已经实现了较好效果，故略去消融实验的部分。

  接下来我们讨论超参数优化的问题：我们采用的办法较为“暴力”，通过多层循环枚举了所有可能的超参数，先进行较短时间的训练确定一个较好的参数：

  ```bash
  #!/bin/bash

  learning_rates=("1e-3" "2e-3" "5e-3" "1e-2")
  latent_dims=(8 12 16 24 32 48 64 96 128 192 256)
  batch_sizes=(64 128 256 512 1024)
  vars=("1e-2" "1e-3" "1e-4")
  epochs=(20 50 70 100)

  configs=()
  for lr in "${learning_rates[@]}"; do
      for dim in "${latent_dims[@]}"; do
          for bs in "${batch_sizes[@]}"; do
              for v in "${vars[@]}"; do
                  for epoch in "${epochs[@]}"; do
                      configs+=("$lr $dim $bs $v $epoch")
                  done
              done
          done
      done
  done
  ```

  我们观察到一些规律：

  #figure(image("image-2.png"), caption: [Loss 随超参数设置的变化])


  #box([
    但是随着潜在空间维数 $d$ 的增加，虽然 VAEwolabel 的结果越来越好，Genwithlabel 的结果逐渐开始不可接受：

    #columns(2)[
      #figure(image("image-5.png", width: 200pt), caption: [$d=256$])
      #colbreak()
      #figure(image("image-4.png", width: 200pt), caption: [$d=512$])
    ]
  ])

  因此最终选定了实验中使用到的参数

= Conclusion / 总结

在实验中，我们成功实现了一个带标签的条件变分自编码器（CVAE），并在 MINST 数据集上进行了训练和测试。通过实验，我们验证了 VAE 的基本原理和条件生成的有效性，并得到了较好的定量和定性结果。

= Appendix / 补充信息

- 理论学习用时：$tilde 2h$
- 实验用时：$tilde 5h$
- 报告用时（含制图、排版等）：$tilde 3h$

本次作业的反馈：建议补充 ELBO 相关的理论，并且说明 EM 方法是怎样通过控制一个紧的下界来优化变分推断的，目前的文档逻辑发展稍微有些奇怪（例如缺少必要的说明下，直接要求推导 ELBO 形式）
