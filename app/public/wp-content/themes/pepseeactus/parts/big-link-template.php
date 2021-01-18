<?php 
    $download = get_field('download');
    $backlink = get_field('backlink');
    $soundcloud = get_field('soundcloud');
    $youtube = get_field('youtube');
    $spotify = get_field('spotify');
    $deezer = get_field('deezer');
    $apple = get_field('apple_music'); 
?>
<div class="stream">
    <p>Streamez et supportez vos artistes</p>
    <ul>
        <?= ($backlink) ? '<li><a href="'.$backlink.'" target="_blank">
            <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 314 314" xml:space="preserve">
                <path d="M7,138.428c-3.866,0-7,3.134-7,7v23.145c0,3.866,3.134,7,7,7s7-3.134,7-7v-23.145C14,141.561,10.866,138.428,7,138.428z"/>
                <path d="M34.273,138.428c-3.866,0-7,3.134-7,7v23.145c0,3.866,3.134,7,7,7s7-3.134,7-7v-23.145
                C41.273,141.561,38.14,138.428,34.273,138.428z"/>
                <path d="M61.546,128.635c-3.866,0-7,3.134-7,7v42.73c0,3.866,3.134,7,7,7s7-3.134,7-7v-42.73
                C68.546,131.769,65.412,128.635,61.546,128.635z"/>
                <path d="M88.818,117.063c-3.866,0-7,3.134-7,7v65.875c0,3.866,3.134,7,7,7c3.866,0,7-3.134,7-7v-65.875
                C95.818,120.196,92.685,117.063,88.818,117.063z"/>
                <path d="M116.092,96.588c-3.866,0-7,3.134-7,7v106.824c0,3.866,3.134,7,7,7c3.866,0,7-3.134,7-7V103.588
                C123.092,99.722,119.958,96.588,116.092,96.588z"/>
                <path d="M143.364,48.071c-3.866,0-7,3.134-7,7v203.857c0,3.866,3.134,7,7,7c3.866,0,7-3.134,7-7V55.071
                C150.364,51.205,147.23,48.071,143.364,48.071z"/>
                <path d="M170.637,65.43c-3.866,0-7,3.134-7,7V241.57c0,3.866,3.134,7,7,7c3.866,0,7-3.134,7-7V72.43
                C177.637,68.563,174.503,65.43,170.637,65.43z"/>
                <path d="M197.909,100.148c-3.866,0-7,3.134-7,7v99.703c0,3.866,3.134,7,7,7c3.866,0,7-3.134,7-7v-99.703
                C204.909,103.282,201.775,100.148,197.909,100.148z"/>
                <path d="M225.183,121.067c-3.866,0-7,3.134-7,7v57.864c0,3.866,3.134,7,7,7s7-3.134,7-7v-57.864
                C232.183,124.201,229.049,121.067,225.183,121.067z"/>
                <path d="M252.456,129.971c-3.866,0-7,3.134-7,7v40.059c0,3.866,3.134,7,7,7c3.866,0,7-3.134,7-7v-40.059
                C259.456,133.105,256.322,129.971,252.456,129.971z"/>
                <path d="M279.728,138.428c-3.866,0-7,3.134-7,7v23.145c0,3.866,3.134,7,7,7c3.866,0,7-3.134,7-7v-23.145
                C286.728,141.561,283.594,138.428,279.728,138.428z"/>
                <path d="M307,138.428c-3.866,0-7,3.134-7,7v23.145c0,3.866,3.134,7,7,7s7-3.134,7-7v-23.145
                C314,141.561,310.866,138.428,307,138.428z"/>
            </svg>
            Streamer
        </a></li>' : ''; ?>
        <?= ($soundcloud) ? '<li><a href="'.$soundcloud.'" target="_blank">
            <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 317.531 317.531" xml:space="preserve">
                <path d="M270.275,141.93c-3.134,0-6.223,0.302-9.246,0.903c-3.289-15.779-11.423-30.182-23.436-41.249
                    c-14.363-13.231-33.037-20.518-52.582-20.518c-9.533,0-19.263,1.818-28.139,5.256c-3.862,1.497-5.78,5.841-4.284,9.703
                    c1.496,3.863,5.838,5.781,9.703,4.284c7.165-2.776,15.022-4.244,22.72-4.244c32.701,0,59.532,24.553,62.411,57.112
                    c0.211,2.386,1.548,4.527,3.6,5.763c2.052,1.236,4.571,1.419,6.778,0.49c3.948-1.66,8.146-2.501,12.476-2.501
                    c17.786,0,32.256,14.475,32.256,32.267c0,17.792-14.473,32.268-32.263,32.268c-1.002,0-106.599-0.048-110.086-0.061
                    c-3.841-0.084-7.154,2.778-7.591,6.659c-0.464,4.116,2.497,7.829,6.613,8.292c0.958,0.108,109.962,0.109,111.064,0.109
                    c26.061,0,47.263-21.205,47.263-47.268C317.531,163.134,296.332,141.93,270.275,141.93z"/>
                <path d="M7.5,153.918c-4.142,0-7.5,3.358-7.5,7.5v60.039c0,4.142,3.358,7.5,7.5,7.5s7.5-3.358,7.5-7.5v-60.039
                    C15,157.276,11.642,153.918,7.5,153.918z"/>
                <path d="M45.917,142.037c-4.142,0-7.5,3.358-7.5,7.5v71.07c0,4.142,3.358,7.5,7.5,7.5s7.5-3.358,7.5-7.5v-71.07
                    C53.417,145.395,50.059,142.037,45.917,142.037z"/>
                <path d="M85.264,110.21c-4.142,0-7.5,3.358-7.5,7.5v111c0,4.142,3.358,7.5,7.5,7.5c4.142,0,7.5-3.358,7.5-7.5v-111
                    C92.764,113.568,89.406,110.21,85.264,110.21z"/>
                <path d="M125.551,111.481c-4.142,0-7.5,3.358-7.5,7.5v109.826c0,4.142,3.358,7.5,7.5,7.5c4.142,0,7.5-3.358,7.5-7.5V118.981
                    C133.051,114.839,129.693,111.481,125.551,111.481z"/>
            </svg>
        </a></li>' : ''; ?>
        <?= ($youtube) ? '<li><a href="'.$youtube.'" target="_blank">
            <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 209.673 209.673" xml:space="preserve">
                <path d="M173.075,29.203H36.599C16.418,29.203,0,45.626,0,65.812v78.05c0,20.186,16.418,36.608,36.599,36.608h136.477
                    c20.18,0,36.598-16.422,36.598-36.608v-78.05C209.673,45.626,193.255,29.203,173.075,29.203z M194.673,143.861
                    c0,11.915-9.689,21.608-21.598,21.608H36.599c-11.91,0-21.599-9.693-21.599-21.608v-78.05c0-11.915,9.689-21.608,21.599-21.608
                    h136.477c11.909,0,21.598,9.693,21.598,21.608V143.861z"/>
                <path d="M145.095,98.57L89.499,61.92c-2.303-1.519-5.254-1.649-7.684-0.342c-2.429,1.308-3.944,3.845-3.944,6.604v73.309
                    c0,2.759,1.515,5.295,3.944,6.604c1.113,0.6,2.336,0.896,3.555,0.896c1.442,0,2.881-0.415,4.129-1.239l55.596-36.659
                    c2.105-1.388,3.372-3.74,3.372-6.262C148.467,102.31,147.2,99.958,145.095,98.57z M92.871,127.562V82.109l34.471,22.723
                    L92.871,127.562z"/>
            </svg>
        </a></li>' : ''; ?>
        <?= ($spotify) ? '<li><a href="'.$spotify.'" target="_blank">
            <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 186.845 186.845" xml:space="preserve">
                <path d="M128.875,120.962c-31.094-14.37-74.616-8.014-76.453-7.737c-4.096,0.619-6.915,4.44-6.296,8.536
                    c0.619,4.096,4.443,6.912,8.536,6.296c0.406-0.062,40.867-5.982,67.92,6.521c1.018,0.471,2.089,0.694,3.142,0.694
                    c2.834-0.001,5.546-1.614,6.813-4.355C134.274,127.157,132.635,122.7,128.875,120.962z"/>
                <path d="M137.614,93.953c-35.313-16.319-84.833-9.087-86.924-8.772c-4.094,0.619-6.911,4.438-6.294,8.532
                    c0.616,4.095,4.438,6.916,8.531,6.301c0.468-0.071,47.206-6.857,78.394,7.556c1.02,0.471,2.089,0.694,3.142,0.694
                    c2.834-0.001,5.546-1.614,6.814-4.356C143.014,100.148,141.374,95.691,137.614,93.953z"/>
                <path d="M143.49,65.736c-39.006-18.027-93.79-10.028-96.103-9.679c-4.094,0.619-6.911,4.438-6.294,8.532s4.44,6.919,8.531,6.3
                    c0.523-0.079,52.691-7.657,87.573,8.463c1.018,0.471,2.089,0.694,3.142,0.694c2.834,0,5.546-1.614,6.813-4.355
                    C148.89,71.93,147.25,67.474,143.49,65.736z"/>
                <path d="M93.423,0.001C41.909,0.001,0,41.909,0,93.42c0,51.514,41.909,93.424,93.423,93.424c51.513,0,93.422-41.91,93.422-93.424
                    C186.845,41.909,144.936,0.001,93.423,0.001z M93.423,171.844C50.18,171.844,15,136.664,15,93.42
                    c0-43.241,35.18-78.42,78.423-78.42c43.242,0,78.422,35.179,78.422,78.42C171.845,136.664,136.665,171.844,93.423,171.844z"/>
            </svg>
        </a></li>' : ''; ?>
        <?= ($deezer) ? '<li><a href="'.$deezer.'" target="_blank">
            <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="97.75px" height="97.75px" viewBox="0 0 97.75 97.75" xml:space="preserve">
                <path d="M48.875,0C21.883,0,0,21.882,0,48.875S21.883,97.75,48.875,97.75S97.75,75.868,97.75,48.875S75.867,0,48.875,0z
                        M25.676,69.248H12.365v-4.033h13.311V69.248z M25.676,64.006H12.365V59.97h13.311V64.006z M25.676,58.762H12.365v-4.035h13.311
                    V58.762z M25.676,53.516H12.365v-4.033h13.311V53.516z M25.676,48.271H12.365v-4.034h13.311V48.271z M40.604,69.248H27.291v-4.033
                    h13.313V69.248z M40.604,64.006H27.291V59.97h13.313V64.006z M40.604,58.762H27.291v-4.035h13.313V58.762z M55.531,69.248H42.219
                    v-4.033h13.313L55.531,69.248L55.531,69.248z M55.531,64.006H42.219V59.97h13.313L55.531,64.006L55.531,64.006z M55.531,58.762
                    H42.219v-4.035h13.313L55.531,58.762L55.531,58.762z M55.531,53.516H42.219v-4.033h13.313L55.531,53.516L55.531,53.516z
                        M55.531,48.271H42.219v-4.034h13.313L55.531,48.271L55.531,48.271z M55.531,43.026H42.219v-4.034h13.313L55.531,43.026
                    L55.531,43.026z M55.531,37.783H42.219v-4.035h13.313L55.531,37.783L55.531,37.783z M70.457,69.248H57.145v-4.033h13.313
                    L70.457,69.248L70.457,69.248z M70.457,64.006H57.145V59.97h13.313L70.457,64.006L70.457,64.006z M70.457,58.762H57.145v-4.035
                    h13.313L70.457,58.762L70.457,58.762z M70.457,53.516H57.145v-4.033h13.313L70.457,53.516L70.457,53.516z M70.457,48.271H57.145
                    v-4.034h13.313L70.457,48.271L70.457,48.271z M85.385,69.248H72.072v-4.033h13.312V69.248z M85.385,64.006H72.072V59.97h13.312
                    V64.006z M85.385,58.759H72.072v-4.034h13.312V58.759z M85.385,53.516H72.072V49.48h13.312V53.516z M85.385,48.271H72.072v-4.037
                    h13.312V48.271z M85.385,43.025H72.072v-4.033h13.312V43.025z M85.385,37.78H72.072v-4.033h13.312V37.78z M72.072,32.536v-4.034
                    h13.312v4.034H72.072z"/>
            </svg>
        </a></li>' : ''; ?>
        <?= ($apple) ? '<li><a href="'.$apple.'" target="_blank">
            <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 203.499 203.499" xml:space="preserve">
                <path d="M101.019,42.436c0.505,0.104,1.009,0.153,1.505,0.153c3.491,0,6.617-2.451,7.341-6.005
                    c0.992-4.872,2.777-8.841,5.305-11.798h0c4.427-5.174,11.371-7.62,16.67-8.772c-0.151,2.534-0.529,5.473-1.344,8.424
                    c-1.102,3.993,1.24,8.124,5.233,9.227c0.668,0.185,1.34,0.272,2.001,0.272c3.289,0,6.307-2.181,7.225-5.505
                    c3.052-11.051,1.661-21.517,1.601-21.956c-0.519-3.765-3.776-6.561-7.57-6.475c-0.928,0.018-22.859,0.593-35.214,15.035
                    c0,0-0.001,0.001-0.002,0.002c-4.202,4.915-7.097,11.156-8.603,18.552C94.341,37.649,96.961,41.61,101.019,42.436z"/>
                <path d="M176.913,138.307c-11.453-3.661-19.148-14.205-19.148-26.237c0-10.6,6.2-20.378,15.796-24.912
                    c1.956-0.925,3.418-2.649,4.01-4.731c0.592-2.081,0.255-4.317-0.923-6.133c-10.028-15.452-26.857-24.678-45.019-24.678
                    c-8.499,0-18.092,3.254-27.44,9.243c-9.35-5.99-18.941-9.243-27.44-9.243c-27.521,0-55.382,21.658-55.382,63.053
                    c0,39.156,26.076,88.831,55.382,88.831c8.498,0,18.09-3.253,27.44-9.244c9.349,5.991,18.941,9.244,27.44,9.244
                    c22.699,0,41.919-28.95,50.171-55.85C183.005,143.723,180.826,139.557,176.913,138.307z M131.63,188.499
                    c-6.567,0-14.94-3.418-22.971-9.377c-1.327-0.985-2.898-1.478-4.469-1.478c-1.571,0-3.142,0.492-4.469,1.477
                    c-8.033,5.96-16.405,9.378-22.971,9.378c-16.681,0-40.382-38.184-40.382-73.831c0-33.016,20.933-48.053,40.382-48.053
                    c6.567,0,14.939,3.418,22.971,9.377c2.652,1.968,6.283,1.969,8.938-0.001c8.03-5.958,16.403-9.376,22.971-9.376
                    c10.505,0,20.406,4.316,27.651,11.819c-10.245,7.965-16.515,20.384-16.515,33.635c0,15.987,8.798,30.275,22.522,37.555
                    C157.049,171.568,142.684,188.499,131.63,188.499z"/>
            </svg>
        </a></li>' : ''; ?>
    </ul>
</div>
<?php if ($download) : ?>
    <div class="download">
        <p>For promotional use only</p>
        <a href="<?php $download ?>" target="_blank">Télécharger</a>
    </div>
<?php endif; ?>
