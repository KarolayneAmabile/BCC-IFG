function main()
    matrix = [ 5, -1, 1, 5;
               2, 0, 1, 2;
              -1, 2, 2, 0];


    %% or, if wanna test with a random matrix
    %% matrix = getMatrix(10)

    matrix = pivote(matrix);

    [num_rows, num_cols] = size(matrix);

    printf('The solution for the below system:\n');

    for row = 1:num_rows
        for col = 1:(num_cols - 1)
            fprintf('(%.2f*x%d) ', matrix(row, col), col);
            if col < (num_cols - 1)
                fprintf('+ ');
            endif
        endfor
        fprintf('= %.2f\n', matrix(row, num_cols));
    endfor

    matrix = gaussJordan(matrix, num_rows);

    printf("\nIs: \n");
    for i = 1:num_rows
      printf('x%d = %.2f\n', i, matrix(i, num_cols));
    endfor


    printf("\nVerification (using matrix inversion):\n");
    result = getResult(matrix);
    for i = 1:num_rows
      printf(' x%d = %.2f ', i, result(i));
    endfor
endfunction

function matrix = getMatrix(length)
  matrix = magic(length + 1);
  matrix = matrix(1:end - 1, :);
endfunction

%% pivots the matrix to have the largest values on the diagonal
function matrix = pivote(matrix)
  n = size(matrix, 1);

  %% loop through each column of the diagonal
  for k = 1:n

    %% find the largest value (in absolute value) in column k
    [val_max, idx_max] = max(abs(matrix(k:n, k)));

    %% Adjust the index
    idx_max = idx_max + k - 1;

    %% Swap row k with the row that has the largest value
    if idx_max ~= k
      temp = matrix(k, :);
      matrix(k, :) = matrix(idx_max, :);
      matrix(idx_max, :) = temp;
    end
  end
endfunction

function matrix = gaussJordan(matrix, matrixLength)
  %% set the coordinates of the pivot
  pivoteRow = 1;
  pivoteColumn = 1;

  %% forward elimination
  for i = 1:(matrixLength - 1)
    %% normalize
    matrix(pivoteRow, :) = matrix(pivoteRow, :)/matrix(pivoteRow, pivoteColumn);

    for currentRow = (pivoteRow + 1):(matrixLength)
      %% compute the factor
      factor = matrix(currentRow, pivoteColumn);
      matrix(currentRow, :) = matrix(currentRow, :) - factor * matrix(pivoteRow, :);
    endfor
    pivoteRow += 1;
    pivoteColumn += 1;
  endfor

  matrix(pivoteRow, :) = matrix(pivoteRow, :)/matrix(pivoteRow, pivoteColumn);

  %% backward elimination
  for i = 1:(matrixLength - 1)
    for currentRow = (pivoteRow - 1):-1:1
      %% compute the factor
      factor = matrix(currentRow, pivoteColumn);
      matrix(currentRow, :) = matrix(currentRow, :) - factor * matrix(pivoteRow, :);
    endfor
    pivoteRow -= 1;
    pivoteColumn -= 1;
  endfor
endfunction

function result = getResult(matrix)
    x = matrix(:, end);
    matrix = matrix(:, 1:(end - 1));
    matrix = inv(matrix);
    result = matrix * x;
endfunction
