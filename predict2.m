function [precision, recall, f_score] = predict2(hypotesis, true_states, class_number)

precision = zeros(1, class_number);
recall = zeros(1, class_number);
f_score = zeros(1, class_number);

for i = 1:class_number
    i
    actual_pos = (hypotesis == i) & (true_states == i);
    assume_pos = hypotesis == i;
    true_pos = true_states == i;

    tp = sum(actual_pos);
    precision(i) = tp / sum(assume_pos);
    recall(i) = tp / sum(true_pos);

    f_score(i) = 2 * precision(i) * recall(i) / (precision(i) + recall(i));
end

end
