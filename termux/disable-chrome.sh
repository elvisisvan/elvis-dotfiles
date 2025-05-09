#!disable-chrome.sh

sudo pm disable com.android.chrome

sudo pm list packages -d | grep chrome
