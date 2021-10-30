#!/bin/bash

out="output.html"
style="borland"

clean() {
	sed 's/^repo\///'
}

cat > "$out" <<EOF
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
EOF

echo "<style>" >> $out
pygmentize -f html -S $style >> $out
echo "</style>" >> $out

cat >> "$out" <<EOF
<style>
	h2 {
		font-family: monospace;
		font-weight: normal;
		background-color: #DDD;
		padding: 5px;
	}
</style>
</head>
<body>
EOF

process() {
	opts=""
	[[ "$1" =~ "templates" ]] && opts="$opts -l html+django "
	[[ "$1" == *.gml ]] && opts="$opts -l javascript "
	>&2 echo $opts
	pygmentize -f html $opts "$1"
}

find . -type f -not -path "*.git*" | while read path; do
	echo $path | clean
	
	output=$(process $path)
	
	if [ $? -eq 0 ]; then
		cat >> "$out" <<EOF
<h2>$(echo $path | clean)</h2>
EOF
	echo "$output" >> "$out"
	fi

done

echo "</body>" >> "$out"
