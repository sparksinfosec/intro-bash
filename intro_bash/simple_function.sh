#!/usr/bin/bash
function RectangleArea {
	read -p "Enter the Length: "  lengthvar
        read -p "Enter the Width: "  widevar
	area=$(($lengthvar * $widevar))
	echo "The area of the rectangle is $area"
}
RectangleArea
