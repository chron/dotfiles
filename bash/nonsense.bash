anagram() {
  # https://raw.githubusercontent.com/first20hours/google-10000-english/master/google-10000-english.txt
  echo "$@" | tr A-Z a-z | ~/workspace/anagram/anagram -m 3 -l 4 -f ~/words "$@" | awk '{ print length, $0 }' | sort -n -r -s | cut -d" " -f2- | tail -n 500 | tidy-up-anagram-results
}

remove-word() {
  for word in "$@"
  do
    sed -i -e "/^$(echo $word | tr A-Z a-z)$/d" ~/words
  done
}

add-word() {
  for word in "$@"
  do
    echo $word | tr A-Z a-z >> ~/words
  done
}
