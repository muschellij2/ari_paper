
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ari\_paper

<!-- badges: start -->

<!-- badges: end -->

The goal of ari\_paper is to showcase the [`ari`
package](https://cran.r-project.org/package=ari). We show how to use
each function and the output videos. This README uses the
[`video`](https://github.com/muschellij2/video) package to render videos
inside the markdown. The paper can be viewed at
<https://johnmuschelli.com/ari_paper/>.

## Making videos with `ari`: `ari_stitch`

``` r
library(tuneR)
library(ari)
result = ari_stitch(
  ari_example(c("mab1.png", "mab2.png")),
  list(noise(), noise()),
  output = "noise.mp4")
isTRUE(result)
attributes(result)$outfile
```

![](README_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->

## Creating Speech from Text: `ari_spin`

Let us take a part of Mercutio’s speech from Shakespeare’s Romeo and
Juliet \[@shakespeare2003romeo\] and overlay it on 2 images from the
Wikipedia page about Mercutio
(<https://en.wikipedia.org/wiki/Mercutio>):

``` r
res = ffmpeg_audio_codecs()
fdk_enabled = grepl("fdk", res[ res$codec == "aac", "codec_name"])
if (fdk_enabled) {
  audio_codec = "libfdk_aac"
} else {
  audio_codec = "aac"
}
speech =  c(
  "I will now perform part of Mercutio's speech from Shakespeare's Romeo and Juliet.", 
  "O, then, I see Queen Mab hath been with you.
   She is the fairies' midwife, and she comes
   In shape no bigger than an agate-stone
   On the fore-finger of an alderman,
   Drawn with a team of little atomies
   Athwart men's noses as they lies asleep;")
mercutio_file = "death_of_mercutio.png"
mercutio_file2 = "mercutio_actor.png"

output = "romeo.mp4"
if (!file.exists(output)) {
  run_voice = "Joanna"
  ari_spin(
    c(mercutio_file, mercutio_file2),
    speech, output = output, voice = run_voice,
    service = "amazon",
    audio_codec = audio_codec)
}
```

![](README_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->

We can also generate the video using the voice `Brian`, which is an
British English male voice:

![](README_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->
