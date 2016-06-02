function out = acc_to_pos(file_from, file_to)
% usage
% acc_to_pos('data/acc.csv', 'data/pos.csv')
%
% long description
% -
% --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
% --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
% functions

function s = find_pos(a, delta)
    s = a * delta^2 / 2;
end

% --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

acc_data = csvread (file_from);

m = size(acc_data, 1);  % samples number
delta = 0.1;  % delta time

labels = acc_data(:, end);
acc_data = acc_data(:, 1:end-1);

% starting position for each accelerometer
wrist = [1 0 0];
breast = [0 1 0];
hip = [0 0 0];

current_pos = [breast hip wrist];
pos_data = zeros(size(acc_data));

for i = 1:m
    current_pos =current_pos+ find_pos(acc_data(i, :), delta);
    pos_data(i, :) = current_pos;
end

csvwrite(file_to, [pos_data labels]);


% --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
% --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
end
