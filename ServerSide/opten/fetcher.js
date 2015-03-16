module.exports = {

	getActivityForTheDay: function () {
		var fs = require('fs');
		fs.readFile("./opten/data/activity.txt" ,'utf8', function(err, data){
			if (err) console.log(JSON.stringify(err));
			console.log(JSON.stringify(data));
		});
	}

};
