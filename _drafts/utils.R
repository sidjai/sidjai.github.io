getJkylYaml <- function(layout, title, ...){
	addList <- c(layout = layout, title = title, list(...))
	addYaml <- paste0(names(addList), ": ", addList)
	addYaml <- c("---", addYaml, "---")

	return(addYaml)
}

publishGitio <- function(path, layout, tags, noFoot = FALSE, shPreview = FALSE){
	if(grepl("[.]rmd", path)){
		knitr::render_jekyll(highlight = "pygments")
		rmarkdown::render(path)
		rmdPath <- path
		mdPath <- gsub("[.]rmd", ".md", path)
	} else {
		rmdPath <- gsub("[.]md", ".rmd", path)
		mdPath <- path
	}

	blogRoot <- dirname(dirname(path))
	pubMd <- blogMd <- readLines(mdPath)

	blogRmd <- readLines(rmdPath)

	normTitle <- grabYamlOpt(rmdPath, "title")
	normAuthor <- grabYamlOpt(rmdPath, "author")

	postFileName <- paste0(strftime(Sys.time(), '%Y-%m-%d-'),
												 gsub(" ", '-', normTitle), ".md")
	pathPub <- paste(blogRoot, "_posts", postFileName , sep = '/')

	jYaml <- getJkylYaml(
		layout,
		title = normTitle,
		author = normAuthor,
		tags = tags,
		comments = "true")

  pubMd <- gsub("\\\\[<]-", "<-", pubMd)
	pubMd <- gsub("\\\\[*]", "*", pubMd)
	
	pubMd <- c(jYaml, pubMd, "")
	if(!noFoot){
		footer <- paste0("*rmarkdown files for this post can be found at: ",
			"https://github.com/sidjai.github.io/", rmdPath, "*")
		pubMd <- c(pubMd, footer)
		
	}

	
	writeLines(pubMd, pathPub)

	#build with jekyll
	system(paste("cd", paste0('"', blogRoot, '"'), "&&", "jekyll build"))
	
	if(shPreview){
		system(paste("cd", paste0('"', blogRoot, '"'), "&&", "jekyll serve --no-watch"))
	}


}

grabYamlOpt <- function(path, option){
	if( length(path) == 1){
		lines <- readLines(path)
	} else {
		lines <- path
	}
	yOpt <- paste0(option, ": ")
	verbOpt <- gsub(yOpt, '', grep(yOpt, lines, value = TRUE))

	return( gsub('"', '', verbOpt))
}
