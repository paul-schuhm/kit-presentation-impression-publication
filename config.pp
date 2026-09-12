#Markdown sources to publish

#slides(presentation, slide-deck)
SOURCES_SLIDES=(
    slides.md
)

#standard document
SOURCES_DOCS=(
    document.md
)

#Printing : Formats printed by default
do_print_html_single=true
do_print_html_deck=true
do_print_pdf=true
do_print_epub=false

#Publication : enable/disable
do_publish_on_ftp_server=false

#Formats published by default
do_publish_html_single=true
do_publish_html_pdf=true
do_publish_html_deck=false
do_publish_html_epub=false

#FTP config
FTP_HOST="host"
FTP_USER="your ftp user"
FTP_PASS="your ftp user pass"
REMOTE_DIR="path to copy on the ftp server"
