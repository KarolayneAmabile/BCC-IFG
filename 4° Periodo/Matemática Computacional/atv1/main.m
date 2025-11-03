function main
  %% static values
  xl = 3;            %% lower limit of interval
  xu = 4;            %% upper limit of interval
  tolerance = 1e-5;  %% tolerance
  max_iter = 1000;   %% maximum number of iterations allowed

  %% call the bisection function and store the root, all root values found and the iteration count
  [raiz, iter, xr_values] = bisection(xl, xu, tolerance, max_iter);

  %% print results
  printf("Raiz aproximada: %.5f\n", raiz);
  printf("Iteracoes necessarias: %d\n", iter);
endfunction

%% function that calculates the value of f(x)
function fx = func(x)
  fx = tan(x) .* ((35/2)*(x.^3) - 44*(x.^2) + 887*x + 229);
endfunction

%% function that applies the bisection method to find a root of f(x)
%% return: the root (xr), the number of iterations needed to reach tolerance (inter)
%% and a matrix with all root values found
function [xr, iter, xr_values] = bisection(xl, xu, tolerance, max_iter)
  iter = 0;                        %% iteration counter
  xr0 = inf;                       %% previous midpoint for comparison
  xr_values = zeros(max_iter, 1);  %% xr_values[max_inter, 1]

  %% loop until convergence or reaching maximum iterations
  while (iter < max_iter)
    %% compute midpoint between xl and xu
    xr = (xl + xu) / 2;

    %% store the root value found
    xr_values(iter + 1, 1) = xr;

    %% check for convergence
    if iter > 0 && abs(xr - xr0) < tolerance
      break;
    endif

    %% update interval based on sign of function
    if func(xl) * func(xr) < 0
      xu = xr;       %% the root is on the first half of the interval
    elseif func(xl) * func(xr) > 0
      xl = xr;       %% the root is on the second half of the interval
    endif

    %% store current midpoint for next iteration
    xr0 = xr;
    %% update iteration counter
    iter = iter + 1;
  endwhile

  %% trim the matrix to contain only computed values
  xr_values = xr_values(1:iter, 1);
endfunction

