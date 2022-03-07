## swirl


| You can exit swirl and return to the R prompt (>) at any time by pressing the Esc key. If you are
| already at the prompt, type bye() to exit and save your progress. When you exit properly, you'll
| see a short message letting you know you've done so.

| When you are at the R prompt (>):
| -- Typing skip() allows you to skip the current question.
| -- Typing play() lets you experiment with R on your own; swirl will ignore what you do...
| -- UNTIL you type nxt() which will regain swirl's attention.
| -- Typing bye() causes swirl to exit. Your progress will be saved.
| -- Typing main() returns you to swirl's main menu.
| -- Typing info() displays these options again.



help.start()

list.files()
complete.cases()

args(list.files)

file.exists()
file.info()
file.rename()
file.copy()
file.path()

dir.create(file.path('testdir2', 'testdir3'), recursive = TRUE) => create nested directories

seq()
seq(along.with = my_seq)
seq_along(my_seq)
rep(c(0, 1, 2), times = 10)
rep(c(0, 1, 2), each = 10)
paste(my_char, collapse = " ")
which(ints > 7)
any()
all()
evaluate(function(x){x+1}, 6)
table()
lapply()
sapply()
vapply(numeric(1))
tapply()
tapply(flags$animate, flags$landmass, mean)

rowSums = apply(x, 1, sum)
rowMeans = apply(x, 1, mean)
colSums = apply(x, 2, sum)
colMeans = apply(x, 2, mean)

# Average matrix in an array
a <- array(rnorm(2 * 2 * 10), c(2, 2, 10)) # 3 dimensional matrix
apply(a, c(1, 2), mean)
# or
rowMeans(a, dims = 2)

object.size()

rbinom(1, size = 100, prob = 0.7)
rbinom(100, size = 1, prob = 0.7)

rpois(5, 10)
my_pois <- replicate(100, rpois(5, 10))
colMeans(my_pois)
hist(cm)
# Looks like our column means are almost normally distributed, right? That's the Central Limit Theorem at work, but that's a
# lesson for another day!
data(mtcars)
boxplot(mpg ~ cyl, data = mtcars)

search()