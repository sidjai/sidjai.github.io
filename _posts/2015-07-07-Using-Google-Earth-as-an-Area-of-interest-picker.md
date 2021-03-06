---
layout: post
title: Using Google Earth as an Area of interest picker
author: Siddarta Jairam
tags: R
comments: true
---
Using the raster package to query geospatial data sets is easy. You can
use coordinates, a station list, an extent object, the grid row or col
and logical subseting. However, what if you want a more complex object
to query the data? What if you wanted a non-standard state region, the
area between two lakes and a mountain, the area between two amusement
parks, or the region in a flood plain between two evacuation centers?
Initially, you would think the answer is external data. This could
involve changing the projection, changing the grid size, masking some
areas or other data manipulations. At the very least you are tying your
analysis to another outside data source that could change over time and
has a reputation on its own.

Let's face it, during this evaluation and manipulation, you are going to
have one eye on Google maps anyways. Many times this level of analysis
is not even needed with the grid size that you want or the desired
accuracy. What you really want is a back of the envelope area of
interest that can be plugged in to find initial results and iterated on
if the problem requires it. If you only need to highlight a certain area
on a map or have a quick hypothesis about an area, it shouldn't require
a whole new data set.

So how do you do this back of the envelope picker? First, you would use
Google earth to identify the area you want to study. It has lots of
guides using various borders, landmarks, natural structures, elevation
etc. Then you would select the area using a new polygon. The polygon is
defined by its vertices which you can add and move around to fit the
area. When you are finished, name it as something memorable, right click
its name in the left window and save with "Save Place As". Here save it
as a KML document with the same name as the polygon. This is just an XML
document with a useful header and a listing of all the vertices that you
created.

Loading this file into R is kind of convoluted. I am sure there is a
dedicated package to do this but I am going to use a procedure that uses
things that are probably already loaded in this analysis, rgdal and
raster.

    getAOIfKML <- function(path, outResolution){
      require(raster)
      require(rgdal)

      layerName <- gsub("[.]kml", '', basename(path))
      return(raster(
        readOGR(path, layerName, verbose=FALSE),
        resolution = outResolution
      ))
    }

"readOGR" from rgdal is kind of weird that it requires a layer name
apriori. Here the assumption is that it is the same as the file name but
this is only the case depending on what name was given to the added
polygon. One could also read the kml file like a regular xml file and
look for the tag "name" to find the layer name if you want to adapt this
workflow.

Now that the area is a Raster object with a simple lat/lon projection,
subseting and manipulation is easy to do. Now this procedure can easily
be automated with a interactive pop up but, if you are as bad with basic
geography as I am (or the average american) you have either Google maps,
Google Earth or some other maps in front of you anyways. In this
workflow, you can also go back and edit the polygons into something more
precise if need be.

This procedure is in the middle of analysis techniques in terms of time
invested and accuracy as shown below.

1.  Extent - Coarse analysis where other features demand the focus
2.  Google Earth polygon - When it needs to conform to boundaries or
    landmarks
3.  External data - When you need to query the data to get an area

It may seem that out of these three, this procedure needs the most
justification. However, the other two can have plenty of hand-waving
under the surface. Grid sizes and the complexity of the AOI has an
effect on what you pick as well. Documentation goes up dramatically as
you go down the list but you will have to do that with whatever you use.
