examples
example1 
	
	| model n b ds points rand res |
	model := PMLinearRegression new.
	n := 30.
	rand := Random new.
	points := (1 to: n) collect: [ :x | x@(2 * x + (rand next * 20 - 10)) ].
	points do: [ 
		:p | 
		model add: p.
	 ].
 
	b := RTGrapher new.
	b extent: 500 @ 500.
	ds := RTData new.
	ds dotShape cross color: (Color red alpha: 0.3).
	ds points: points.
	ds x: [ :p | p x ].
	ds y: [ :m | m y ].
	b add: ds.
	res := RTData new.
	res dotShape ellipse  color: (Color blue).
	res points: points.
	res connect.
	res x: [ :p | p x ].
	res y: [ :p |  
		model value: p x.
	].
	b add: res.
	^ b.
