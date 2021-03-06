---
layout: page
title: Projects
author: Siddarta Jairam
---

##Biosplit: Moth migration model

This project connects biological models of growth and death of migrant moths over generations with physical models about dispersal of particles over continental scales. The titular model is the HYSPLIT air dispersal model from NOAA. Extent and magnitude of infestation is governed by the planting, growth and harvesting of corn. The program is released on github [here!](https://github.com/sidjai/biosplit)

##matconv: A code converter from MatLab to R

The time and headaches that come from migrating legacy code into a new language keeps many from transitioning to R. MatLab users have a different perspective since R and MatLab are very similar in scope and purpose. The connection is so close that many of the base functions can be transferred 1 to 1 to R with a few syntax quirks. Beyond changing simple things like loop syntax, this program aims to migrate these base functions and even transfer the data structures to a given format. This can be found on github [here!](https://github.com/sidjai/matconv).

##tf2statr: A utility to query Team Fortress 2 stats

Finding and looking through logs is now an arduous process spanning multiple APIs and websites. This package attempts to consolidate this information by bringing the stats into R. This opens up the process to the power of R along with quick and easier sharing of these stats. It can be found as an R package on Github [here!](https://github.com/sidjai/tf2statr).

##Integrated Environmental, Health and Safety Index (IEHS)

This program calculates risk for a chemical factory in the process flowsheet and conceptual design phase. Too many design decisions are made without a feeling of consequence or the larger scale relative importance of those decisions. Immediate monetary measures are relied upon heavily that are largely independent of the small decisions on the ground, has much larger swings in value from outside forces and supply chain decisions, adds a greater margin of error from a completely different field and does not yield actionable design decisions for a chemical designer. This index tries to frame the question differently in a field that has dire consequences that are within the scope and expertise of a common designer, safety. This index tries to break down the overall risk into their spatial and ideological scale components. This is all reported in a simple scale from -1 to 1 from first principle equations and widely used correlations. The code will be available in MatLab and R on Linux and Windows platforms.

##isCSnAlive: A web app to monitor live usage of a Team Fortress 2 server

When people are interested in playing on a server they have requirements to get the most of their playing time. This includes, the right map choice, friends that they are used to playing with, small skill gap so their is a competitive match and a long length before these conditions change. Most server tools only look at the basic information where you may be able to see a list of players. For the servers like the critsandvich network, waiting times to get into a server may be upwards of 30 mins during prime-time. Players need to ensure they are going to get the experience they want before loading up the game and getting in the waiting line. This shiny app runs off a shiny server on a amazon ec2 machine and does basic forecasting to give the player and idea about their experience based on a month's worth of data. The app can be found [here!](http://apps.decision-cream.com/isCSnAlive/).
