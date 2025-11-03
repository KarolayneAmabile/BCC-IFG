function newtonRaphson()
  clc;
  x0 = [-2; 4];
  numInt = 1000;

  for i = 1:numInt
    x1 = x0 - inv(jacobiano(x0)) * funcao(x0);
    x0 = x1
  endfor
end

%% vetores
function y = funcao(x)
  x1 = x(1);
  x2 = x(2);

  y = [3*x1^2 + 4*x1*x2 - 5*x2 + 10
       4*x1 + 6*x2^2 - 2*x1*x2 + 8];
end

function J = jacobiano(x)
  x1 = x(1);
  x2 = x(2);

  J = [6*x1 + 4*x2,    4*x1 - 5
       4 - 2*x2,       12*x2 - 2*x1];
end

