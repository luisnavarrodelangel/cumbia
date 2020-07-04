module Sound.Seis8s.Style where

import Sound.Seis8s.Generic
import Sound.Seis8s.Harmony
import Sound.Seis8s.Rhythm

import Data.Maybe
import Data.Tempo
import Data.Time
import qualified Data.List

-- style should be a collection of individual records that might be accessed or not by the context.
-- The style could have many different fields to access at a time. pianoRhythmPattern4 -- they are defined but no universal. The style is the rhythm (and other stuff) of all the instruments
-- 1) A style is a library of musical information, a style has a pianoRhyhtmPattern

type NPattern = [Int]


data Style  = Style  {
 altavozRhythmPattern0 :: RhythmicPattern,
 altavozSampleNPattern0 :: NPattern,
 altavozPitchPattern0 :: PitchPattern,
 altavozPanPattern0 :: Double,
 altavozGainPattern0 :: Double,

 pianoSampleNPattern0 :: NPattern,
 pianoSampleNPattern1 :: NPattern,
 pianoPitchPattern0 :: PitchPattern,
 pianoRhythmPattern0 :: RhythmicPattern, -- or could this be accompaniment (used for various instruments)?-- [(Rational, Rational)] -- not universal value, but semiuniversal values.
 pianoRhythmPattern1 :: RhythmicPattern,
 pianoPanPattern0 :: Double,
 pianoGainPattern0 :: Double,



 cuerdaRhythmPattern0 :: RhythmicPattern,
 cuerdaSampleNPattern0 :: NPattern,
 cuerdaPitchPattern0 :: PitchPattern,
 cuerdaPanPattern0 :: Double,
 cuerdaGainPattern0 :: Double,


 efectoRhythmPattern0 :: RhythmicPattern,
 efectoSampleNPattern0 :: NPattern,
 efectoPitchPattern0 :: PitchPattern,
 efectoPanPattern0 :: Double,
efectoGainPattern0 :: Double,


 bassSampleNPattern0 :: NPattern,
 bassSampleNPattern1 :: NPattern,
 bassSampleNPattern2 :: NPattern,
 bassRhythmPattern0 ::  RhythmicPattern,
 bassRhythmPattern1 ::  RhythmicPattern,
 bassRhythmPattern2 ::  RhythmicPattern,
 bassPitchPattern0 :: PitchPattern,  --index
 bassPitchPattern1 :: PitchPattern,  --index
 bassPitchPattern2 :: PitchPattern,  --index
 bassPanPattern0 :: Double,
 bassGainPattern0 :: Double,


 guiraRhythmPattern0 :: RhythmicPattern,
 guiraSampleNPattern0 ::NPattern, -- this should not take the harmony
 guiraPitchPattern0 :: PitchPattern,
 guiraPanPattern0 :: Double,
 guiraGainPattern0 :: Double,

 contrasRhythmPattern0 :: RhythmicPattern,
 contrasSampleNPattern0 :: NPattern,
 contrasPitchPattern0 :: PitchPattern,
 contrasPanPattern0 :: Double,
 contrasGainPattern0 :: Double,

 tarolaRhythmPattern0 :: RhythmicPattern,
 tarolaSampleNPattern0 :: NPattern,
 tarolaPitchPattern0 :: PitchPattern,
 tarolaPanPattern0 :: Double,
 tarolaGainPattern0 :: Double,

 extrasRhythmPattern0 :: RhythmicPattern,
 extrasSampleNPattern0 :: NPattern,
 extrasPitchPattern0 :: PitchPattern,
 extrasPanPattern0 :: Double,
 extrasGainPattern0 :: Double

} deriving (Show)


 -- type PitchPostion = (Rational, Pitch)
 -- type PitchPattern = [PitchPostion]
 -- type RhythmicPosition = (Rational,Rational)
 -- type RhythmicPattern = [RhythmicPosition]

defaultStyle :: Style
defaultStyle = Style {

   altavozRhythmPattern0 = [(1, 0)],
   altavozSampleNPattern0 = [0],
   altavozPitchPattern0 = ("midinote", [("mn", 60, 0)]),
   altavozPanPattern0 = 0.5,
   altavozGainPattern0 = 1,


   pianoSampleNPattern0 = [0],
   pianoSampleNPattern1 = [0],
   pianoRhythmPattern0 = [(1, 0)], -- ie.  [𝄽  𝄽  𝄽  ♩],
   pianoRhythmPattern1 = [], -- ie. [𝄽 ♩ 𝄽 ♩],
   pianoPitchPattern0 = ("intervalo", [("segunda" , 0, 0)]),
   pianoPanPattern0 = 0.5,
   pianoGainPattern0 = 1,

   cuerdaRhythmPattern0 = [(1,0)],
   cuerdaSampleNPattern0 = [0],
   cuerdaPitchPattern0 = ("intervalo", [("unisono", 0, 0)]),
   cuerdaPanPattern0 = 0.5,
   cuerdaGainPattern0 = 1,

   bassSampleNPattern0 = [0],
   bassSampleNPattern1 = [],
   bassSampleNPattern2 = [],  --index
   bassRhythmPattern0 = [(1, 0)],  --i.e. [♩ 𝄽  ♩ 𝄽 ],
   bassRhythmPattern1 = [],  --i.e. [♩ 𝄽  ♩ ♩],
   bassRhythmPattern2 =  [],
   bassPitchPattern0 = ("intervalo", [("unisono", 0, 0)]), -- int
   bassPitchPattern1 = ("intervalo", [("unisono", 0, 0)]),  --interval
   bassPitchPattern2 = ("intervalo", [("unisono", 0, 0)]),  --index
   bassPanPattern0 = 0.5,
   bassGainPattern0 = 1,

   guiraRhythmPattern0 = [(1,0)],
   guiraSampleNPattern0 = [0],
   guiraPitchPattern0 = ("midinote", [("mn", 60, 0)]),
   guiraPanPattern0 = 0.5,
   guiraGainPattern0 = 1,

   contrasRhythmPattern0 = [(1, 0)],
   contrasSampleNPattern0 = [0],
   contrasPitchPattern0 =("midinote", [("mn", 60, 0)]),
   contrasPanPattern0 = 0.5,
   contrasGainPattern0 = 1,

   tarolaRhythmPattern0 = [(1, 0)],
   tarolaSampleNPattern0 = [0],
   tarolaPitchPattern0 = ("midinote", [("mn", 60, 0)]),
   tarolaPanPattern0 = 0.5,
   tarolaGainPattern0 = 1,

   efectoRhythmPattern0 = [(1, 0)],
   efectoSampleNPattern0 = [0],
   efectoPitchPattern0 = ("intervalo", [("unisono", 0, 0)]),
   efectoPanPattern0 = 0.5,
   efectoGainPattern0 = 1,

   extrasRhythmPattern0 = [(1, 0)],
   extrasSampleNPattern0 = [0],
   extrasPitchPattern0 = ("intervalo", [intervalo "unisono" 0]),
   extrasPanPattern0 = 0.5,
   extrasGainPattern0 = 1
}

--hh
--metal

-- where cumbia is a collection of all , but no information from the gmm harmonies or pitches. Might be information on how to pick harmonies. resist the temptation to customize, if I need new information I should make a new field to it.
-- cumbia is a collection of knowledges (this would change). Try not to be too specific or universal

-- user to access the presets or only have one preset that can be modified with functions
-- maybe have two, functions that transform them
-- options: override information, field tranformation, tranform all the rhythm at the same time?,
-- eg. remove any attacks but the fundamental, where multiple fields get transformed,
-- but still be particular to the style, so it will still be specific

-- supercollider is modular that expects information from the user.

cumbia :: Style
cumbia = Style {
    altavozRhythmPattern0 = [(1, 0)],
    altavozSampleNPattern0 = [0],
    altavozPitchPattern0 = ("midinote", [("mn", 60, 0)]),
    altavozPanPattern0 = 0.5,
    altavozGainPattern0 = 1,

    pianoRhythmPattern0 = [(1, 0.75)], -- ie.  [𝄽  𝄽  𝄽  ♩],
    pianoSampleNPattern0 = [0],
    pianoRhythmPattern1 = [(1,0.25), (1, 0.75)], -- ie. [𝄽 ♩ 𝄽 ♩],
    pianoSampleNPattern1 = [0, 0],
    pianoPitchPattern0 = ("intervalo", [intervalo "unisono" 0, intervalo "3a" 0, intervalo "5a" 0]), -- not used yet
    pianoPanPattern0 = 0.5,
    pianoGainPattern0 = 1,


    cuerdaRhythmPattern0 = [(1,0)],
    cuerdaSampleNPattern0 = [0],
    cuerdaPitchPattern0 = ("intervalo", [intervalo "unisono" 0]), -- or double? (nota [0, 2, 3] cumbia) cuerda
    cuerdaPanPattern0 = 0.5,
    cuerdaGainPattern0 = 1,


    bassRhythmPattern0 = [(1, 0), (1, 0.5), (1, 0.75)],  --i.e. [♩ 𝄽  ♩ ♩],
    bassSampleNPattern0 = [0, 0, 0],
    bassPitchPattern0 = ("intervalo", [intervalo "unisono" 0, intervalo "3a" 0, intervalo "5a" 0]), -- index from list of pitches i.e. [60, 64, 67]
    bassRhythmPattern1 = [(1, 0), (1, 0.5)],  --i.e. [♩ 𝄽  ♩ 𝄽 ],
    bassSampleNPattern1 = [0, 0],
    bassPitchPattern1 = ("intervalo", [intervalo "unisono" 0, intervalo "5a" 0]),
    bassPanPattern0 = 0.5,
    bassGainPattern0 = 1,

    -- bassRhythmPattern2 = [(8, 0), (8, 0.5), (8, 0.75), (8, 1), (8, 1.5), (8, 1.75), (8, 2), (1, 2.5), (8, 2.75), (8, 3), (8, 3.5), (8, 3.75), (8, 4), (8, 4.5), (8, 4.75), (8, 5), (8, 5.5), (8, 5.75), (8, 6), (8, 6.5), (8, 6.75), (8, 7), (8, 7.25), (8, 7.5), (8, 7.75)],  --i.e. [♩ 𝄽  ♩ 𝄽
    -- bassSampleNPattern2 = take 25 $ cycle [0],
    -- bassPitchPattern2 = [0, 1, 2, 0, 1, 2, 0, 1, 2, 0, 1, 2, 0, 1, 2, 0, 1, 2, 0, 1, 2, 0, 2, 0, 2],
    -- tonicayquinta2 $ cumbia bajo
    -- Aqui, escucharás tres notas distinas, la tónica, la quinta y la quinta una octava abajo (i.e. más grave).
    bassRhythmPattern2 = [(1, 0), (1, 0.5), (1, 0.75)],
    bassSampleNPattern2 = [0, 0, 0],
    bassPitchPattern2 = ("intervalo", [intervalo "unisono" 0, intervalo "5a" 0, intervalo "5a" (-1)]), -- index from list of pitches i.e. [60, 64, 67]

    -- bassRhythmPattern2 = [(4, 0), (4, 0.5), (4, 0.75), (4, 1), (4, 1.5), (4, 1.75), (4, 2), (4, 2.5), (4, 2.75), (4, 3), (4, 3.25), (4, 3.5), (4, 3.75)],
    -- bassSampleNPattern2 = take 13 $ cycle [0],
    -- bassPitchPattern2 = ("intervalo", [intervalo "unisono", intervalo "3a", intervalo "5a", intervalo "unisono", intervalo "3a", intervalo "5a", intervalo "unisono", intervalo "3a", intervalo "5a", intervalo "unisono", intervalo "5a", intervalo "unisono", intervalo "5a"]),




    guiraRhythmPattern0 = [(1, 0), (1, 0.25), (1, 0.375), (1, 0.5), (1, 0.75), (1, 0.875)], --i.e. [♪♫ ♪♫ ♪♫ ♪♫]
    guiraSampleNPattern0 = [0, 1, 2, 0, 1, 2],
    guiraPitchPattern0 = ("midinote", [("mn", 60, 0), ("mn", 60, 0), ("mn", 60, 0), ("mn", 60, 0), ("mn", 60, 0), ("mn", 60, 0)]),
    guiraPanPattern0 = 0.5,
    guiraGainPattern0 = 1,

    contrasRhythmPattern0 = [(1, 0), (1, 0.25), (1, 0.5), (1, 0.75)],
    contrasSampleNPattern0 = [0, 1, 0, 1, 0, 1, 0, 1],
    contrasPitchPattern0 = ("midinote", [("mn", 60, 0), ("mn", 60, 0), ("mn", 60, 0), ("mn", 60, 0), ("mn", 60, 0), ("mn", 60, 0)]),
    contrasPanPattern0 = 0.5,
    contrasGainPattern0 = 1,

    tarolaRhythmPattern0 = [(1, 0.1875), (1, 0.375)],
    tarolaSampleNPattern0 = [0, 0],
    tarolaPitchPattern0 = ("midinote", [("mn", 60, 0), ("mn", 60, 0)]),
    tarolaPanPattern0 = 0.5,
    tarolaGainPattern0 = 1,

    efectoRhythmPattern0 = [(1, 0)],
    efectoSampleNPattern0 = [0],
    efectoPitchPattern0 = ("intervalo", [intervalo "unisono" 0]),
    efectoPanPattern0 = 0.5,
    efectoGainPattern0 = 1,

    extrasRhythmPattern0 = [(1, 0)],
    extrasSampleNPattern0 = [0],
    extrasPitchPattern0 = ("intervalo", [intervalo "unisono" 0]),
    extrasPanPattern0 = 0.5,
    extrasGainPattern0 = 1

  }


-- 1. When to play

rhythmicPattern :: RhythmicPattern -> (Tempo -> UTCTime -> UTCTime ->  [Rational])
rhythmicPattern xs t iw ew  = Data.List.sort $ concat $ fmap (\(x, y) -> findBeats t iw ew x y) xs

samplePattern :: [(RhythmicPosition, Int)] -> Tempo -> UTCTime -> UTCTime -> [(Rational, Int)]
samplePattern xs t iw ew =  Data.List.sort $ concat $ fmap (\x -> samplePattern' x t iw ew) xs

samplePattern' :: (RhythmicPosition, Int) -> Tempo -> UTCTime -> UTCTime -> [(Rational, Int)]
samplePattern' (xs, sampleNumber) t iw ew  = fmap (\attack -> (attack, sampleNumber)) attacks
  where
    attacks = findBeats t iw ew (fst xs) (snd xs)

pitchPattern :: [(RhythmicPosition, Note)] -> Tempo -> UTCTime -> UTCTime -> [(Rational, Note)]
pitchPattern xs t iw ew =  Data.List.sort $ concat $ fmap (\x -> pitchPattern' x t iw ew) xs

pitchPattern' :: (RhythmicPosition, Note) -> Tempo -> UTCTime -> UTCTime -> [(Rational, Note)]
pitchPattern' (xs, (relacion, midiOintervalo, octava)) t iw ew  = fmap (\attack -> (attack, (relacion, midiOintervalo, octava))) attacks
  where
    attacks = findBeats t iw ew (fst xs) (snd xs)

--webdirt uses end uses the % dependant on the length of the sample, cut is used for drums (might be useful)
--we might need to add the duration parameters
