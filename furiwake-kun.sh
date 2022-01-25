#!/bin/sh 


search_path="./test"
dest_path_base="/L/01_動画像/new"
list_movie=("AVI" "mov" "MOV" "mp4" "MP4")
list_image=("ai" "gif" "jpeg" "jpg" "JPG" "png" "PNG" "psd")

find $search_path | while read f ; do
  yearmonth=`date -r "$f" '+%Y-%m'`
  ext=${f##*.}

  if printf '%s\n' "${list_movie[@]}" | grep -qx $ext; then
    mv "$f" "$dest_path_base/02_動画/$yearmonth"
  elif printf '%s\n' "${list_image[@]}" | grep -qx $ext; then
    mv "$f" "$dest_path_base/01_画像/$yearmonth"
  else
    mv "$f" "$dest_path_base/03_その他/$yearmonth"
  fi

done



# 拡張子一覧抽出
# find . -type f -exec basename {} \; | grep -o '\.[^.]*$' | sort | uniq

# 拡張子取得
# ${f##*.}

# for dir in $dirs;
# do
#     echo "-----------------------"
#     echo $dir
#     echo "-----------------------"
#     movies=`find $dir/* -maxdepth 0 -type f -name *.mov -or -name *.MOV -or -name *.mp4 -or -name *.MP4`
    
#     for movie in $movies;
#     do
#         # echo $movie
#         mv $movie "../02_動画/$dir/"
#     done
# done


# isomu@DESKTOP-F2M7O9O MSYS /L/01_動画像
# $ find . -type f -exec basename {} \; | grep -o '\.[^.]*$' | sort | uniq
# .ai
# .AVI
# .dat
# .db
# .gif
# .ithmb
# .jpeg
# .jpg
# .JPG
# .LOG
# .mov
# .MOV
# .mp4
# .MP4
# .png
# .PNG
# .psd
# .sh
# .VIX