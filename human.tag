<human>
	<h3>Tell A Joke</h3>
	<button type="button" onclick={ tellJoke }>Tell Gigi A Random Joke</button>
	<div class="jokeMaker">
		<!-- ref or reference attribute is a quick way to "bookmark" an element so we can quickly access it in javascript later. -->
		<!-- E.g. HTML <img ref="xxx"/>  -->
		<!-- E.g. JS   this.refs.xxx points to the img tag prior -->
		<input type="text" ref="jokeContent" placeholder="Enter A Joke">
		<button type="button" onclick={ addJoke }>Add</button>
	</div>

	<div class ="jokeContainer" each={myJokes}>
		<p>{value}</p>
    <button type="button" onclick={ removeJoke }>Remove</button>
  </div>

	<script>
		this.myJokes = [{
			value: "¯\_(ツ)_/¯"
		},{
			value: "( ͡° ͜ʖ ͡°)"
		},{
			value: "ಠ_ಠ"
		},{
			value: "(ᵔᴥᵔ)"
		},{
			value: "(=^ェ^=)"
		},{
			value: "ʕ •ᴥ•ʔ"
		},{
			value: "(•_•) ( •_•)>⌐■-■ (⌐■_■)"
		},{
			value: "╭∩╮（︶︿︶）╭∩╮"
		},{
			value: "ლ(ಠ益ಠ)ლ",
		},{
			value: "(=^ェ^=)"
		}]



		this.removeJoke = function(event) {
			// In RiotJS, event.item refers to the object of the child tag where the click event occurred.
			console.log(event);
			console.log(event.item);

			var jokeObj = event.item;

			var index = this.myJokes.indexOf(jokeObj);
			console.log(index);

			this.myJokes.splice(index, 1);
		};

		this.addJoke = function(event) {
			//console.log(typeof(this.refs.jokeContent.value));
			var newJoke = {};
			//console.log(newJoke);
			newJoke.value = this.refs.jokeContent.value;
			//console.log(newJoke);

			this.myJokes.push(newJoke);
			this.refs.jokeContent.value = "";
		};

		this.tellJoke = function(){
			var max = this.myJokes.length;
			var tempIndex = Math.floor(Math.random() * Math.floor(max));
			alert(this.myJokes[tempIndex].value);
		}
	</script>


	<style>
		:scope {
			display: block;
			background: grey;
			padding: 15px;
			vertical-align: bottom;
		}
    button{
      margin-left: 3px;
    }
    p{
      padding: 5px;
    }

		.jokeContainer{
			display: inline-block;
		}
	</style>
</human>
