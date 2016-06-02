class_number = 2
m = 100

function out = randint(d1, d2, r)
    out = round(rand(d1, d2) * (r(2) - r(1)) + r(1));
end

hypotesis = randint(1, m, [1 class_number]);
true_states = randint(1, m, [1 class_number]);

[precision, recall, f_score] = predict2(hypotesis, true_states, class_number)
