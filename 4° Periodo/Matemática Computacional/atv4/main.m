function regressao_polinomial()
  % Função principal que define os parâmetros e chama as funções auxiliares
  % Resolve o exercício de regressão polinomial por mínimos quadrados

  clc;
  close all;

  % ========== DEFINIÇÃO DOS PARÂMETROS ==========
  x = [0.2, 0.5, 0.8, 1.2, 1.7, 2.0, 2.3];
  y = [500, 700, 1000, 1200, 2200, 2650, 3750];
  x_est = 1.4;
  graus = [1, 2, 3];

  fprintf('\n========== REGRESSÃO POLINOMIAL POR MÍNIMOS QUADRADOS ==========\n\n');
  fprintf('Dados de entrada:\n');
  fprintf('x: '); fprintf('%.1f ', x); fprintf('\n');
  fprintf('y: '); fprintf('%.0f ', y); fprintf('\n');
  fprintf('Ponto de estimativa: x = %.1f\n\n', x_est);

  % ========== PROCESSAR CADA GRAU ==========
  resultados = cell(length(graus), 1);

  for i = 1:length(graus)
    grau = graus(i);

    % Chama a função que implementa o método numérico
    [coef, r2, r] = calcular_regressao(x, y, grau);

    % Armazena os resultados
    resultados{i}.grau = grau;
    resultados{i}.coef = coef;
    resultados{i}.r2 = r2;
    resultados{i}.r = r;

    % Imprime os resultados
    imprimir_resultados(grau, coef, r2, r, x_est);
  end

  % ========== PLOTAR GRÁFICOS ==========
  plotar_graficos(x, y, x_est, resultados);

  fprintf('\n========== FIM DA EXECUÇÃO ==========\n\n');
end


% ========== FUNÇÃO ONDE É IMPLEMENTADO APENAS O MÉTODO NUMÉRICO ==========
function [coef, r2, r] = calcular_regressao(x, y, grau)
  % Implementa o método de mínimos quadrados para regressão polinomial
  % Entrada:
  %   x - vetor com valores de x
  %   y - vetor com valores de y
  %   grau - grau do polinômio
  % Saída:
  %   coef - coeficientes do polinômio [a0, a1, a2, ...]
  %   r2 - coeficiente de determinação
  %   r - raiz quadrada de r2

  % Construir matriz de Vandermonde
  n = length(x);
  A = zeros(n, grau + 1);

  for i = 1:(grau + 1)
    A(:, i) = x(:).^(i - 1);
  end

  % Resolver sistema normal pelo método dos mínimos quadrados
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


% ========== FUNÇÕES PARA PLOTAGEM DE CADA GRÁFICO ==========
function plotar_graficos(x, y, x_est, resultados)
  % Plota os gráficos de cada polinômio ajustado

  figure('Position', [100, 100, 1400, 450]);

  % Criar pontos para as curvas suaves (passo de 0.1)
  x_curva = min(x):0.1:max(x);

  for i = 1:length(resultados)
    grau = resultados{i}.grau;
    coef = resultados{i}.coef;
    r2 = resultados{i}.r2;

    % Calcular y para a curva ajustada
    y_curva = avaliar_polinomio(coef, x_curva);

    % Calcular valor estimado em x_est
    y_est = avaliar_polinomio(coef, x_est);

    % Criar subplot
    subplot(1, 3, i);

    % Plotar dados originais
    plot(x, y, 'bo', 'MarkerSize', 10, 'MarkerFaceColor', 'b', 'LineWidth', 2);
    hold on;

    % Plotar curva ajustada
    plot(x_curva, y_curva, 'r-', 'LineWidth', 2);

    % Plotar ponto estimado
    plot(x_est, y_est, 'gs', 'MarkerSize', 12, 'MarkerFaceColor', 'g', 'LineWidth', 2);

    % Configurações do gráfico
    grid on;
    xlabel('x', 'FontSize', 12, 'FontWeight', 'bold');
    ylabel('y', 'FontSize', 12, 'FontWeight', 'bold');
    title(sprintf('Polinômio de Grau %d\n(r² = %.4f)', grau, r2), ...
          'FontSize', 13, 'FontWeight', 'bold');
    legend('Dados originais', 'Curva ajustada', sprintf('Estimativa x=%.1f', x_est), ...
           'Location', 'northwest', 'FontSize', 10);

    set(gca, 'FontSize', 10);
    xlim([0 2.5]);

    hold off;
  end

  % Título geral
  sgtitle('Regressão Polinomial por Mínimos Quadrados', ...
          'FontSize', 16, 'FontWeight', 'bold');
end


% ========== FUNÇÕES AUXILIARES ==========
function y_valores = avaliar_polinomio(coef, x_valores)
  % Avalia o polinômio com os coeficientes dados nos pontos x_valores

  grau = length(coef) - 1;
  y_valores = zeros(size(x_valores));

  for i = 1:(grau + 1)
    y_valores = y_valores + coef(i) * x_valores.^(i - 1);
  end
end


function imprimir_resultados(grau, coef, r2, r, x_est)
  % Imprime os resultados da regressão no terminal

  fprintf('========================================\n');
  fprintf('POLINÔMIO DE GRAU %d\n', grau);
  fprintf('========================================\n\n');

  % Imprimir equação do polinômio até a sexta casa decimal
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

  % Imprimir coeficientes
  fprintf('Coeficientes [a0, a1, a2, ...]:\n');
  for i = 1:length(coef)
    fprintf('  a%d = %.6f\n', i - 1, coef(i));
  end
  fprintf('\n');

  % Calcular e imprimir valor estimado
  y_estimado = avaliar_polinomio(coef, x_est);
  fprintf('Valor estimado em x = %.6f: y = %.6f\n\n', x_est, y_estimado);

  % Imprimir coeficientes de qualidade
  fprintf('Coeficientes de qualidade do ajuste:\n');
  fprintf('  r²  = %.6f\n', r2);
  fprintf('  r   = %.6f\n\n', r);
end
