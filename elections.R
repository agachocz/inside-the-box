# Example with dice

values <- c(1:6)

one_die <- sample(values, 500, replace = T)
hist(one_die)

second_die <- sample(values, 500, replace = T)
two_dice <- one_die + second_die
hist(two_dice)

third_die <- sample(values, 500, replace = T)
three_dice <- two_dice + third_die
hist(three_dice, breaks= 7)

fourth_die <- sample(values, 500, replace = T)
fifth_die <- sample(values, 500, replace = T)
sixth_die <- sample(values, 500, replace = T)
seventh_die <- sample(values, 500, replace = T)
eighth_die <- sample(values, 500, replace = T)
nineth_die <- sample(values, 500, replace = T)
tenth_die <- sample(values, 500, replace = T)
ten_dice <- three_dice + fourth_die + fifth_die + sixth_die +
  seventh_die + eighth_die + nineth_die + tenth_die
hist(ten_dice, freq = T, breaks = 10)

more_dice <- sample(values, 500, replace = T)
for(i in 1:300){
  more_dice <- more_dice + sample(values, 500, replace = T)
}
hist(more_dice, breaks = 30)

dice_small <- data.frame("1" = one_die, "3" = three_dice) %>% 
        gather() %>% group_by(key)

dice_big <- data.frame("10" = ten_dice, "300" = more_dice) %>% 
  gather() %>% group_by(key)

ggplot(data=dice_small, aes(x = value)) + 
  geom_histogram(bins = 6,
                 #center = 0,
                 col="black", 
                 fill="light blue") + 
  labs(title="Rzuty kośćmi", x="Wartość", y="Wystąpienia") +
  facet_wrap(~key, nrow = 1, scales = "free", dir = "v")

ggplot(data=dice_big, aes(x = value)) + 
  geom_histogram(bins = 15,
                 #center = 0,
                 col="black", 
                 fill="light blue") + 
  labs(title="Rzuty kośćmi", x="Wartość", y="Wystąpienia") +
  facet_wrap(~key, nrow = 1, scales = "free", dir = "v")

