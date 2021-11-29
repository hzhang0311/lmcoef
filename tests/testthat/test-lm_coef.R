test_that("estimation works", {
  expect_equal(lm(0.9,2)$coefficients)
})
