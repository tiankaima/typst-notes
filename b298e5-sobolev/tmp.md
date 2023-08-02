Let's start by reducing the given semi-linear PDE to a second-order ordinary differential equation (ODE) using the fact that the positive solution has to be radially decreasing.

The given semi-linear PDE is:

\[ -\text{div}(|\nabla u|^{p-2}\nabla u) = C|u|^{p^*-2}u \]

where \( C \) is some constant and \( p^* \) is the critical Sobolev exponent.

Now, let's assume that the extremal function \( u \) is radially symmetric. This means that \( u \) depends only on the radial variable \( r = |x| \). In other words, \( u = u(r) \).

Using the radially symmetric assumption, we can write the Laplacian \( \Delta u \) in terms of the radial derivative \( u' \) as follows:

\[ \Delta u = \frac{d^2u}{dr^2} + \frac{n-1}{r}\frac{du}{dr} \]

where \( n \) is the dimension of the space. In one dimension, this reduces to \( n = 1 \).

Next, we need to express the gradient \( \nabla u \) in terms of \( u' \):

\[ \nabla u = \left( \frac{du}{dr}, \frac{1}{r}\frac{du}{d\theta_1}, \ldots, \frac{1}{r}\frac{du}{d\theta_{n-1}} \right) \]

where \( \theta_1, \ldots, \theta_{n-1} \) are the angular variables in \( n \) dimensions.

Now, we need to compute \( |\nabla u| \) and \( |\nabla u|^{p-2} \). Since the function is radially symmetric, the Euclidean norm of the gradient is given by:

\[ |\nabla u| = \sqrt{\left(\frac{du}{dr}\right)^2 + \frac{1}{r^2}\left(\frac{du}{d\theta_1}\right)^2 + \ldots + \frac{1}{r^2}\left(\frac{du}{d\theta_{n-1}}\right)^2} = \sqrt{\left(\frac{du}{dr}\right)^2 + \frac{1}{r^2}\left(\frac{du}{d\theta}\right)^2} \]

where \( \frac{du}{d\theta} \) denotes the derivative of \( u \) with respect to any of the angular variables.

Similarly, \( |\nabla u|^{p-2} \) is:

\[ |\nabla u|^{p-2} = \left(\left(\frac{du}{dr}\right)^2 + \frac{1}{r^2}\left(\frac{du}{d\theta}\right)^2\right)^{\frac{p-2}{2}} \]

Now, let's substitute these expressions back into the original semi-linear PDE:

\[ -\text{div}(|\nabla u|^{p-2}\nabla u) = -\text{div}\left(\left(\left(\frac{du}{dr}\right)^2 + \frac{1}{r^2}\left(\frac{du}{d\theta}\right)^2\right)^{\frac{p-2}{2}}\left(\frac{du}{dr}, \frac{1}{r}\frac{du}{d\theta}\right)\right) = C|u|^{p^*-2}u \]

Simplifying and using the fact that \( u \) is radially symmetric (thus \( \frac{du}{d\theta} = 0 \)), we get:

\[ -\frac{d}{dr}\left(|\nabla u|^{p-2}\frac{du}{dr}\right) = C|u|^{p^*-2}u \]

Now, let's express \( |\nabla u|^{p-2} \) in terms of \( u' \) to further simplify the equation. From the expression we obtained earlier:

\[ |\nabla u|^{p-2} = \left(\left(\frac{du}{dr}\right)^2 + \frac{1}{r^2}\left(\frac{du}{d\theta}\right)^2\right)^{\frac{p-2}{2}} = \left(\left(\frac{du}{dr}\right)^2\right)^{\frac{p-2}{2}} = \left(\frac{du}{dr}\right)^{p-2} \]

Substitute this into the equation:

\[ -\frac{d}{dr}\left(\left(\frac{du}{dr}\right)^{p-2}\frac{du}{dr}\right) = C|u|^{p^*-2}u \]

Finally, divide both sides by \( -(p-1)|u|^{p^*-2} \) and integrate with respect to \( r \):

\[ \int \frac{1}{(p-1)|u|^{p^*-2}}\frac{d}{dr}\left(\left(\frac{du}{dr}\right)^{p-2}\frac{du}{dr}\right) \, dr = -\frac{C}{(p-1)}\int u \, dr + D \]

where \( D \) is an integration constant.

Now, we can simplify the left-hand side using integration by parts:

\[ \int \frac{1}{(p-1)|u|^{p^*-2}}\frac{d}{dr}\left(\left(\frac{du}{dr}\right)^{p-2}\frac{du}{dr}\right) \, dr = \frac{1}{(p-1)|u|^{p^*-2}}\left(\left(\frac{du}{dr}\right)^{p-1}\right) + E \]

where \( E \) is another integration constant.

Now, we have:

\[ \frac{1}{(p-1)|u|^{p^*-2}}\left(\left(\frac{du}{dr}\right)^{p-1}\right) + E = -\frac{C}{(p-1)}\int u \, dr + D \]

\[ \frac{1}{|u|^{p^*-2}}\left(\left(\frac{du}{dr}\right)^{p-1}\right) = -C\int u \, dr + F \]

where \( F = (D-E) \).

At this point, we have reduced the original semi-linear PDE to a first-order ODE involving \( u \) and its derivative \( u' \).

\[ \frac{1}{|u|^{p^*-2}}\left(\left(\frac{du}{dr}\right)^{p-1}\right) = -C\int u \, dr + F \]

Now, solving this first-order ODE for \( u(r) \) will give

 us the extremal function that satisfies the Sobolev inequality with the given value of \( p \) and \( q \). The constant \( F \) will be determined by the boundary conditions or other constraints imposed by the specific Sobolev inequality under consideration.

Please note that finding an explicit solution to this ODE may still be a challenging research problem, and it heavily depends on the specific Sobolev inequality being considered.