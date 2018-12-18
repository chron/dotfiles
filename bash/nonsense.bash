anagram() {
  # https://raw.githubusercontent.com/first20hours/google-10000-english/master/google-10000-english.txt
  ~/workspace/anagram/anagram -m 3 -l 4 -f ~/words "$@" | awk '{ print length, $0 }' | sort -n -r -s | cut -d" " -f2- | tail -n 500 | tidy-up-anagram-results
}

remove-word() {
  sed -i -e "/^$1$/d" ~/words
}

add-word() {
  echo $1 >> ~/words
}
