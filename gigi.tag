<gigi>
  <img onmouseover={speak} src="img/{ petImage }.gif">
  <p if={visible}>{data}{myCurrentJoke}</p>
  <script>
    //make gigi object  observable
    var that = this;

    //initial state/propoerty
    this.petImage = "neutral";
    this.visible = false;
    this.data = "";
    this.myJokes = [
      {
        value: "¯\_(ツ)_/¯"
      }, {
        value: "( ͡° ͜ʖ ͡°)"
      }, {
        value: "ಠ_ಠ"
      }, {
        value: "(ᵔᴥᵔ)"
      }, {
        value: "(=^ェ^=)"
      }
    ];


    this.myCurrentJoke = "temp joke";

    this.selectJoke = function(){
      var max = that.myJokes.length;
      var tempIndex = Math.floor(Math.random() * Math.floor(max));
      that.myCurrentJoke = that.myJokes[tempIndex].value;
    }

    this.clearData = function(){
      this.data = "";
    }

    this.hide = function () {
      this.visible = false;
    }

    this.speak = function () {
      this.clearData();
      this.selectJoke();
      // embed a trigger to inform mimi + pass data
      observable.trigger('gigiSpeak', this.myCurrentJoke);
      this.visible = true;
      setTimeout(function () {
        that.hide();
        that.update();
      }, 1000);
    }

    this.wait = function(){
      setTimeout(function () {
        that.respond();
      }, 1000);
    }

    this.respond = function () {
      that.selectJoke();
      that.visible = true;
      that.update();
      // console.log(this);
      setTimeout(function () {
        that.hide();
        that.update();
      }, 1000);
    }

    observable.on('mimiSpeak', function(passedData){
      that.data = passedData;
      that.wait();
    });

  </script>

  <style>
    :scope {
      margin: auto;
      color: blue;
    }

    img {
      width: 60%;
    }
  </style>
</gigi>
