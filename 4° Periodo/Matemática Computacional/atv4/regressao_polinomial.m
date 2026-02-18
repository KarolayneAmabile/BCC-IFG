function regressao_polinomial()
  clc;
  close all;

  x = [0.2, 0.5, 0.8, 1.2, 1.7, 2.0, 2.3];
  y = [500, 700, 1000, 1200, 2200, 2650, 3750];
  x_est = 1.4;
  graus = [1, 2, 3];

  fprintf('Dados de entrada:\n');
  fprintf('x: '); fprintf('%.1f ', x); fprintf('\n');
  fprintf('y: '); fprintf('%.0f ', y); fprintf('\n');
  fprintf('Ponto de estimativa: x = %.1f\n\n', x_est);

  resultados = cell(length(graus), 1);

  for i = 1:length(graus)
    grau = graus(i);

    [coef, r2, r] = calcular_regressao(x, y, grau);

    resultados{i}.grau = grau;
    resultados{i}.coef = coef;
    resultados{i}.r2 = r2;
    resultados{i}.r = r;

    imprimir_resultados(grau, coef, r2, r, x_est);
  end

  plotar_graficos(x, y, x_est, resultados);
end


function [coef, r2, r] = calcular_regressao(x, y, grau)
  %   x - vetor com valores de x
  %   y - vetor com valores de y
  %   grau - grau do polinômio
  %   coef - coeficientes do polinômio [a0, a1, a2, ...]
  %   r2 - coeficiente de determinação
  %   r - raiz quadrada de r2

  n = length(x);
  A = zeros(n, grau + 1);

  for i = 1:(grau + 1)
    A(:, i) = x(:).^(i - 1);
  end

  % resolver sistema normal pelo método dos mínimos quadrados
  % A' * A * coef = A' * y
  coef = (A' * A) \ (A' * y(:));

  % Calcular valores ajustados
  y_ajustado = A * coef;

  % Calcular resíduos
  residuos = y(:) - y_ajustado;

  % Calcular coeficiente de determinação R²
  SS_res = sum(residuos.^2);
  SS_tot = sum((y(:) - mean(y)).^2);
  r2 = 1 - SS_res / SS_tot;

  % Calcular r
  r = sqrt(r2);
end


function plotar_graficos(x, y, x_est, resultados)
  for i = 1:length(resultados)
    grau = resultados{i}.grau;
    coef = resultados{i}.coef;

    plotar_ajuste(x, y, coef, grau, x_est);
  end
end


function plotar_ajuste(x, y, a, M, xEst)
  xPlot = min(x):0.1:max(x);
  yPlot = avaliar_polinomio(a, xPlot);
  yEst = avaliar_polinomio(a, xEst);

  figure;
  plot(x, y, 'ko', 'markerfacecolor', 'k');
  hold on;
  plot(xPlot, yPlot, 'b', 'linewidth', 2);
  plot(xEst, yEst, 'ro', 'linewidth', 2, 'markersize', 8);
  grid on;
  title(sprintf("Ajuste polinomial de grau %d", M));
  xlabel("x");
  ylabel("y");
  legend("Dados", "Polinômio ajustado", sprintf("Estimativa x=%d", xEst));
  hold off;
end


function y_valores = avaliar_polinomio(coef, x_valores)
  % Avalia o polinômio com os coeficientes dados nos pontos x_valores

  grau = length(coef) - 1;
  y_valores = zeros(size(x_valores));

  for i = 1:(grau + 1)
    y_valores = y_valores + coef(i) * x_valores.^(i - 1);
  end
end


function imprimir_resultados(grau, coef, r2, r, x_est)
  fprintf('Polinomio de grau %d\n', grau);

  fprintf('Equação do polinômio ajustado:\n');
  fprintf('y = %.6f', coef(1));
  for i = 2:length(coef)
    if coef(i) >= 0
      fprintf(' + %.6f*x^%d', coef(i), i - 1);
    else
      fprintf(' - %.6f*x^%d', abs(coef(i)), i - 1);
    end
  end
  fprintf('\n\n');

  fprintf('Coeficientes [a0, a1, a2, ...]:\n');
  for i = 1:length(coef)
    fprintf('  a%d = %.6f\n', i - 1, coef(i));
  end
  fprintf('\n');

  y_estimado = avaliar_polinomio(coef, x_est);
  fprintf('Valor estimado em x = %.6f: y = %.6f\n\n', x_est, y_estimado);

  fprintf('Coeficientes de qualidade do ajuste:\n');
  fprintf('  r²  = %.6f\n', r2);
  fprintf('  r   = %.6f\n\n', r);
end

