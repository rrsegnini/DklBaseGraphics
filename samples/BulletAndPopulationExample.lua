--
-- Example bullet graph and popularion pyramid
--
-- Döiköl Base Graphics Library
--
-- Copyright (c) 2017-2018 Armando Arce - armando.arce@gmail.com
--
-- This library is free software; you can redistribute it and/or modify
-- it under the terms of the MIT license. See LICENSE for details.
--

require "dbg/DklBaseGraphics"


local bg
local x
local y
local col

function setup()
	size(1000,600)
	local f = loadFont("data/Karla.ttf",12)
	textFont(f)
	bg = DklBaseGraphics:new(width(),height())
	x = {100,400, 500, 600, 700}
	x2 = {100,400, 500, 600, 700}
	--x = {210,300}
	
	--For bullet plots, the first value of the y argument is the feature
	--measure, and the second value is the comparative measure
	y = {340,330}
	y2 = {340,330}
	col = {"#00FF00","#FF0000"}
	
	--Twenty items
	dataColumnFemale = {297571, 1224678, 2241729, 3419669,4309255
	,4740901,5582965,6183834,6926294,7420530,6892981,5908884,5846095,
	6102904,5765398,5267178,5046576,4874560,4759562}
	--Twenty items
	dataColumnMale = {78090,495039,1249868,2407959,3503068,4271009
	,5226729,5959000,6872860,7460550,6895010,5888907,5886712,
	6170003,5877444,5468273,5292894,5108872,5001224}
	
		if maxColumn(dataColumnMale)>maxColumn(dataColumnFemale)
	then maxValue = maxColumn(dataColumnMale)
	else maxValue = maxColumn(dataColumnFemale) end
	
	maxValue = maxValue/1000000
	
	
	for i=1, table.getn(dataColumnMale) do
		dataColumnFemale[i] = dataColumnFemale[i]/1000000
		dataColumnMale[i] = dataColumnMale[i]/1000000
		
	end
end

function draw()
	background(255)
	
	bg:par({mfrow={2,1}})
	bg:bulletplot(x,y,{type="l",col=col,bty="n",main="PLOT 3",sub="subplot 3",xlab="X axis",ylab="Y axis"})
	bg:box({which="figure"})
	
	
	bg:populationplot(dataColumnMale,dataColumnFemale,{type="l",col=col,bty="n",main="PLOT 3",sub="subplot 3",xlab="X axis",ylab="Y axis"})
	bg:box({which="figure"})
	

	
	
end

function windowResized(w,h)
	bg:resize_window(w,h)
end
