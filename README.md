# Numerical-Algorithms
Some codes produced in the Numerical Algorithms class in the Federal University of Espírito Santo

## Gauss Jacobi

Jacobi method or Jacobian method is named after German mathematician Carl Gustav Jacob Jacobi (1804 – 1851). The main idea behind this method is,
For a system of linear equations:

a11x1 + a12x2 + … + a1nxn = b1
a21x1 + a22x2 + … + a2nxn = b2
⠇
an1x1 + an2x2 + … + annxn = bn

To find the solution to this system of equations Ax = B, we assume that the system of equations have a unique solution and there is no zero entry among the diagonal or pivot elements of the coefficient matrix A.
Now, we shall begin to solve equation 1 for x1, equation 2 for x2 and so on equation n for xn, we get

x1 = 1/a11 [b1 – a12x2 – a13x3 – … – a1nxn]
x2 = 1/a22 [b2 – a21x1 – a23x3 – … – a2nxn]
⠇
xn = 1/ann [bn – an1x1 – an3x3 – … – an n – 1xn – 1]

By making an initial guess for the solution x(0) = (x1(0), x2(0), …, xn(0)) and substituting these values only to the right hand side of the above equations we get first approximations x(1) = (x1(1), x2(1), …, xn(1)). Continuing this process iteratively we get sequence of approximations {x(k)} such that as k → ∞, this sequence converges to exact solution of the system of equation up to a given error tolerance.

## Gauss Seidel

The Guass-Seidel method is a improvisation of the Jacobi method. This method is named after mathematicians Carl Friedrich Gauss (1777–1855) and Philipp L. Seidel (1821–1896). This modification often results in higher degree of accuracy within fewer iterations.
In Jacobi method the value of the variables is not modified until next iteration, whereas in Gauss-Seidel method the value of the variables are modified as soon as new value is evaluated. For instance, in Jacobi method the value of xi(k) is not modified until the (k + 1)th iteration but in Gauss-Seidel method the value of xi(k) changes in in kth iteration only.

## Gauss Elimination Method

In mathematics, the Gaussian elimination method is known as the row reduction algorithm for solving linear equations systems. It consists of a sequence of operations performed on the corresponding matrix of coefficients. We can also use this method to estimate either of the following:

* The rank of the given matrix
* The determinant of a square matrix
* The inverse of an invertible matrix

To perform row reduction on a matrix, we have to complete a sequence of elementary row operations to transform the matrix till we get 0s (i.e., zeros) on the lower left-hand corner of the matrix as much as possible. That means the obtained matrix should be an upper triangular matrix. There are three types of elementary row operations; they are:

* Swapping two rows and this can be expressed using the notation ↔, for example, R2 ↔ R3
* Multiplying a row by a nonzero number, for example, R1 → kR2 where k is some nonzero number
* Adding a multiple of one row to another row, for example, R2 → R2 + 3R1
* Learn more about the elementary operations of a matrix here.

The obtained matrix will be in row echelon form. The matrix is said to be in reduced row-echelon form when all of the leading coefficients equal 1, and every column containing a leading coefficient has zeros elsewhere. This final form is unique; that means it is independent of the sequence of row operations used.

## LU Decompositon

In linear algebra, LU Decomposition, i.e., lower–upper (LU) decomposition or factorization of a matrix, can be defined as the product of a lower and an upper triangular matrices. This product sometimes comprises a permutation matrix as well. We can relate the LU decomposition method with the matrix form of the Gaussian elimination method of solving a system of linear equations.

## Linear Least Square

The least-squares method is a crucial statistical method that is practised to find a regression line or a best-fit line for the given pattern. This method is described by an equation with specific parameters. The method of least squares is generously used in evaluation and regression. In regression analysis, this method is said to be a standard approach for the approximation of sets of equations having more equations than the number of unknowns.

The method of least squares actually defines the solution for the minimization of the sum of squares of deviations or the errors in the result of each equation. Find the formula for sum of squares of errors, which help to find the variation in observed data.

The least-squares method is often applied in data fitting. The best fit result is assumed to reduce the sum of squared errors or residuals which are stated to be the differences between the observed or experimental value and corresponding fitted value given in the model.

There are two basic categories of least-squares problems:

* Ordinary or linear least squares
* Nonlinear least squares

These depend upon linearity or nonlinearity of the residuals. The linear problems are often seen in regression analysis in statistics. On the other hand, the non-linear problems are generally used in the iterative method of refinement in which the model is approximated to the linear one with each iteration.

## Zero Functions Method

### Bisection method

Follow the below procedure to get the solution for the continuous function:

For any continuous function f(x),

* Find two points, say a and b such that a < b and f(a)* f(b) < 0
* Find the midpoint of a and b, say “t”
* t is the root of the given function if f(t) = 0; else follow the next step
* Divide the interval [a, b] – If f(t)*f(a) <0, there exist a root between t and a
* – else if f(t) *f (b) < 0, there exist a root between t and b
* Repeat above three steps until f(t) = 0.

The bisection method is an approximation method to find the roots of the given equation by repeatedly dividing the interval. This method will divide the interval until the resulting interval is found, which is extremely small.

### Newton's Method for Approximating Zeros

Newton's Method is a geometric method to approximate the zeroes of any function, by using derivatives. The process is relatively simple: Suppose we want to estimate a zero of f(x). First, choose any guess for the zero, and call it x0. Then, calculate x1,x2,x3, and so on using the iterative formula: xn=xn−1−(f(xn−1)/f′(xn−1)), chosen so that (xn,0) is the intersection of the x-axis with the tangent line to the graph y=f(x) at the old x-value x=xn−1. In many but not all cases, each xi gives a better estimate for the zero than the previous value xi−1, and so by repeating this process enough times we can arrive at a reasonably close approximation.

### Secant Method

The secant method is a root-finding procedure in numerical analysis that uses a series of roots of secant lines to better approximate a root of a function f.
