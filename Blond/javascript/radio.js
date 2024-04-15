let previous = document.querySelector('#pre');
let play = document.querySelector('#play');
let next = document.querySelector('#next');
let title = document.querySelector('#title');
let recent_volume = document.querySelector('#volume');
let volume_show = document.querySelector('#volume_show');
let slider = document.querySelector('#duration_slider');
let show_duration = document.querySelector('#show_duration');
let track_image = document.querySelector('#track_image');
let auto_play = document.querySelector('#auto');
let present = document.querySelector('#present');
let total = document.querySelector('#total');
let artist = document.querySelector('#artist');

let timer;
let autoplay = 0;
let index_no = 0;
let playing_song = false;

let track = document.createElement('audio');
document.body.appendChild(track);

let All_song = [
{
    name: "Fist song",
    path: "Músicas/Crack Rock.mp3",
    img: "Imagens/img1.jpg",
    singer: "Fist singer"
}
];

function load_track(index_no) {
    track.src = All_song[index_no].path;
    title.innerHTML = All_song[index_no].name;
    track_image.src = All_song[index_no].img;
    artist.innerHTML = All_song[index_no].singer;
    track.load();
}
load_track(index_no);

function justplay(){
    if(playing_song==false) {
        playing_song();
    } else {
        pausesong();
    }
}

function playsong (){
    track.play();
    playing_song = true;
    play.innerHTML = '<i class="fa fa-pause"></i>';
}

function pausesong(){
    track.pause();
    playing_song
}
