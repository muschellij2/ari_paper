all: index.html RJwrapper.pdf README.html README.md letter.pdf

RJwrapper.pdf: index.Rmd
	Rscript -e "rmarkdown::render('index.Rmd')"

index.html: index.Rmd
	Rscript -e "library(rmarkdown); render('index.Rmd', output_format = html_document())"

README.html: README.Rmd
	Rscript -e "library(rmarkdown); render('README.Rmd', output_format = html_document())"

README.md: README.Rmd
	Rscript -e "rmarkdown::render('README.Rmd')"

letter.pdf: letter.Rmd
	Rscript -e "rmarkdown::render('letter.Rmd')"		

