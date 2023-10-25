# Import the `addr.txt` file from the GitHub repository.
# This file contains a listing of names and addresses (thanks google).
# Parse each line to create a data.frame with the following columns:
# lastname, firstname, streetno, streetname, city, state, zip.
# Keep middle initials or abbreviated names in the firstname column.
# Print out the entire data.frame.
data <- scan('https://github.com/couthcommander/Bios6301/raw/main/datasets/addr.txt', what='', sep="\n")
df <- read.table(data, sep = " ")
df
?data.frame
dat <- strsplit(data, split='\\s{2,}')
lengths(dat)
dat[[1]][3]
addr <- sapply(dat, function(i) {
  i[3]
})
addr[1:3]
addr[1]['\^d+']
strsplit(addr, split='\\s{2,}')
addr[1]
# extract street name
sub('^[0-9 ]+', '', addr[[1]])
streetno <- sub('^[0-9 ]+', '', addr)

#extract street number
sub('([0-9]+).*', '\\1', addr[[1]])
sub('([0-9]+).*', '\\1', addr)
sub(' .*', '', addr)
streetname <- sub('([0-9]+).*', '\\1', addr)

lastname <- sapply(dat, function(i) i[1])
firstname <- sapply(dat, function(i) i[2])
city <- sapply(dat, function(i) i[4])
state <- sapply(dat, function(i) i[5])
zip <- trimws(sapply(dat, function(i) i[6]))
df <- data.frame(lastname, firstname, streetno, streetname, city, state, zip)
head(df)



# alternatively
altdf <- data.frame(cbind(do.call(rbind, dat)[,-3]), streetno, streetname)
head(altdf)
