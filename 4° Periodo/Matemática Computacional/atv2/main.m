function main()
  % initial guess
  x0 = [-1.5; 4];

  % tolerance and max iterations
  tolerance = 1e-5;
  numMaxInt = 100;

  % call Newton-Raphson and get convergence history
  [x, numInt, history_x, history_fx] = newtonRaphson(x0, numMaxInt, tolerance);

  % print results
  fprintf('Raizes aproximadas: x1 = %.5f, x2 = %.5f\n', x(1), x(2));
  fprintf('Iteracoes necessarias: %d\n', numInt);

  %% --- convergence graphic of x1 and x2 ---
  figure;
  plot(1:numInt, history_x(1,1:numInt), 'LineWidth', 2); hold on;
  plot(1:numInt, history_x(2,1:numInt), 'LineWidth', 2);
  xlabel('Número de Iterações'); ylabel('X');
  legend('x1', 'x2');
  grid('on');
  title('Convergência das Variáveis');

  %% --- convergence graphic of f(x); values should tend to zero ---
  figure;
  grid('on');
  plot(1:numInt, history_fx(1,1:numInt), 'LineWidth', 2); hold on;
  plot(1:numInt, history_fx(2,1:numInt), 'LineWidth', 2);
  xlabel('Número de Iterações'); ylabel('F(x)');
  legend('f1(x)', 'f2(x)');
  grid('on');
  title('Convergência das Funções');
end

function y = funcao(x)
  x1 = x(1); x2 = x(2);
  y = [x1^2 - x2 + 1; x1^2 + 1/4*x2^2 - 1];
end

function J = jacobiano(x)
  x1 = x(1); x2 = x(2);
  J = [2*x1, -1; 2*x1, 0.5*x2];
end

function [x1, numInt, history_x, history_fx] = newtonRaphson(x0, numMaxInt, tolerance)
  numInt = 0;
  history_x = zeros(length(x0), numMaxInt);
  history_fx = zeros(length(x0), numMaxInt);

  for i = 1:numMaxInt
    x1 = x0 - jacobiano(x0) \ funcao(x0);
    numInt = numInt + 1;

    % store values for plotting
    history_x(:, i) = x1;
    history_fx(:, i) = funcao(x1);

    % check convergence
    if norm(x1 - x0) < tolerance
      break;
    endif

    x0 = x1;
  endfor

  % trim unused columns
  history_x = history_x(:,1:numInt);
  history_fx = history_fx(:,1:numInt);
end

