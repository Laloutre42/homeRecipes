for file in ./*.jpg
do
	convert ${file} -auto-orient -interlace Plane -strip -resize 320x240 -quality 60 320-240/${file}
	convert ${file} -auto-orient -interlace Plane -strip -resize 165x124 -quality 60 165-124/${file}
	echo "${file} converted"
done

