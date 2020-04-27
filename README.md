# PP Counter

## Description

A small PP counter for usage with [StreamCompanion](https://github.com/Piotrekol/StreamCompanion) that also works with Streamlabs OBS.

Displays your current pp and pp if FCed along with your count of 100s, 50s, and misses.

## How to use

For optimal results, requires the following output patterns for StreamCompanion:

| Name          | Content          |
|:-------------:|:----------------:|
| c100          | !100!            |
| c50           | !50!             |
| miss          | !miss!           |
| livepp        | !PpIfMapEndsNow! |
| maxpp         | !PpIfRestFced!   |

In addition, you need to enable "WebSocketServer output of patterns" in StreamCompanion under the "Output patterns" tab.

In OBS or Streamlabs OBS, add `counter.html` as a browser source.  

## Compiling

Simply compile the project with `haxe build.hxml`.  
The finished script will sit in `/bin/js/main.js`.  
