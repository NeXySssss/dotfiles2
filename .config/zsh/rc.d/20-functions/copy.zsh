copy() {
	printf $@ | xclip -selection clipboard
}
unicopy() {
	copy \\u$@
}
