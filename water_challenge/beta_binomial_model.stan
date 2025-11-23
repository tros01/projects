
data {
    int<lower=1> K; // {treatment, control}
    array[K] int<lower=0> n; // Trials per group
    array[K] int<lower=0> y; // Successes per group
}
parameters {
    vector<lower=0, upper=1>[K] p;
}
model {
    // Jeffreys prior
    p ~ beta(0.5, 0.5);

    // Binomial likelihood
    y ~ binomial(n, p);
}
generated quantities {
    real risk_ratio = p[1] / p[2];
    real odds_ratio = (p[1] / (1 - p[1])) / (p[2] / (1 - p[2]));
}
