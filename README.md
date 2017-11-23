This repository holds the source code for a [half-day Praat workshop](https://web.archive.org/web/20171123001654/http://www.dynamicsoflanguage.edu.au/education-and-outreach/train-with-us/summer-school-2017/program/workshop-praat/) presented at the 2017 Summer School held by the Centre of Excellence for the Dynamics of Language.

# Visualise your own vowels

## A short introduction to Praat for complete beginners

This workshop is designed for people with little experience in using Praat—a cross-platform, open-source phonetics program which assists in the recording, annotation, and analysis of speech sounds. Through the completion of short exercises, participants will be guided through a simple phonetics project from the recording stage to the report-writing stage.

In particular, we will 1) use Praat to record English vowels in /hVd/ environments (e.g. heed, hard, head, hood), 2) learn to identify and label the vocalic components within the speech signal, 3) extract data of these vowels into tables for analysis, 4) produce relevant graphics both in Praat and a spreadsheet program (e.g. Google Sheets, or Excel), and 5) produce a brief report of the vowels, based on a supplied document template.

No practical experience with acoustic phonetics is assumed, though some basic familiarity of linguistics and speech production is preferred (e.g. completed a LING101 course). Participants should come with a laptop and with Praat downloaded and installed (download links supplied below).

- MacOS:          [http://www.fon.hum.uva.nl/praat/download_mac.html](http://www.fon.hum.uva.nl/praat/download_mac.html)
- Windows:        [http://www.fon.hum.uva.nl/praat/download_win.html](http://www.fon.hum.uva.nl/praat/download_win.html)
- Linux:          [http://www.fon.hum.uva.nl/praat/download_linux.html](http://www.fon.hum.uva.nl/praat/download_linux.html)

# Building source code

The handout material for the workshop is written as an RMarkdown file (`index.rmd`), which is compiled to html (`index.html`) using RStudio. Since the style being used is the [Tufte CSS theme](http://rmarkdown.rstudio.com/tufte_handout_format.html), you'll also need to do `install.packages('tufte')` to build the html.
