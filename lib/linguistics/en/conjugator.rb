# Based on MorphAdorner (http://morphadorner.northwestern.edu/)
#
# 
module Linguistics::EN::Conjugator
  
  Linguistics::EN.register_extension( self )
  
  #Load Irregular Verbs
  
  IRREGULAR_VERBS = {
    "withstand"=>{"*"=>{:past=>"withstood", :past_participle=>"withstood"}},
    "outbreed"=>{"*"=>{:past=>"outbred", :past_participle=>"outbred"}},
    "outlay"=>{"*"=>{:past=>"outlaid", :past_participle=>"outlaid"}},
    "deal"=>{"*"=>{:past=>"dealt", :past_participle=>"dealt"}},
    "burst"=>{"*"=>{:past=>"burst", :past_participle=>"burst"}},
    "overslide"=>{"*"=>{:past=>"overslid", :past_participle=>"overslid"}},
    "underthrust"=>
    {"*"=>{:past=>"underthrust", :past_participle=>"underthrust"}},
    "fit"=>{"*"=>{:past=>"fit", :past_participle=>"fit"}},
    "swell"=>{"*"=>{:past=>"swelled", :past_participle=>"swollen"}},
    "knit"=>
    {"*"=>
      {:present_participle=>"knitting",
        :past=>"knitted",
        :past_participle=>"knitted"}},
    "withhold"=>{"*"=>{:past=>"withheld", :past_participle=>"withheld"}},
    "resell"=>{"*"=>{:past=>"resold", :past_participle=>"resold"}},
    "outbid"=>{"*"=>{:past=>"outbid", :past_participle=>"outbid"}},
    "shrink"=>{"*"=>{:past=>"shrank", :past_participle=>"shrunk"}},
    "missay"=>{"*"=>{:past=>"missaid", :past_participle=>"missaid"}},
    "lay"=>{"*"=>{:past=>"laid", :past_participle=>"laid"}},
    "re-cast"=>{"*"=>{:past=>"re-cast", :past_participle=>"re-cast"}},
    "overshoot"=>{"*"=>{:past=>"overshot", :past_participle=>"overshot"}},
    "outswim"=>{"*"=>{:past=>"outswam", :past_participle=>"outswum"}},
    "keep"=>{"*"=>{:past=>"kept", :past_participle=>"kept"}},
    "undersell"=>{"*"=>{:past=>"undersold", :past_participle=>"undersold"}},
    "forecast"=>{"*"=>{:past=>"forecast", :past_participle=>"forecast"}},
    "take"=>{"*"=>{:past=>"took", :past_participle=>"taken"}},
    "picnic"=>
    {"*"=>
      {:present_participle=>"picnicking",
        :past=>"picnicked",
        :past_participle=>"picnicked"}},
    "outdrive"=>{"*"=>{:past=>"outdrove", :past_participle=>"outdriven"}},
    "hide"=>{"*"=>{:past=>"hid", :past_participle=>"hidden"}},
    "sleep"=>{"*"=>{:past=>"slept", :past_participle=>"slept"}},
    "inbreed"=>{"*"=>{:past=>"inbred", :past_participle=>"inbred"}},
    "oversling"=>{"*"=>{:past=>"overslung", :past_participle=>"overslung"}},
    "stick"=>{"*"=>{:past=>"stuck", :past_participle=>"stuck"}},
    "rebind"=>{"*"=>{:past=>"rebound", :past_participle=>"rebound"}},
    "bid"=>{"*"=>{:past=>"bid|bade", :past_participle=>"bid|bidden"}},
    "eat"=>{"*"=>{:past=>"ate", :past_participle=>"eaten"}},
    "speed"=>{"*"=>{:past=>"sped", :past_participle=>"sped"}},
    "unmake"=>{"*"=>{:past=>"unmade", :past_participle=>"unmade"}},
    "predo"=>
    {"third_person_singular"=>{:present=>"predoes"},
      "*"=>{:past=>"predid", :past_participle=>"predone"}},
    "withdraw"=>{"*"=>{:past=>"withdrew", :past_participle=>"withdrawn"}},
    "unswear"=>{"*"=>{:past=>"unswore", :past_participle=>"unsworn"}},
    "halterbreak"=>
    {"*"=>{:past=>"halterbroke", :past_participle=>"halterbroken"}},
    "interweave"=>{"*"=>{:past=>"interwove", :past_participle=>"interwoven"}},
    "unknit"=>
    {"*"=>
      {:present_participle=>"unknitting",
        :past=>"unknitted",
        :past_participle=>"unknitted"}},
    "show"=>{"*"=>{:past=>"showed", :past_participle=>"shown"}},
    "undercut"=>{"*"=>{:past=>"undercut", :past_participle=>"undercut"}},
    "buy"=>{"*"=>{:past=>"bought", :past_participle=>"bought"}},
    "outspeed"=>{"*"=>{:past=>"outsped", :past_participle=>"outsped"}},
    "outsleep"=>{"*"=>{:past=>"outslept", :past_participle=>"outslept"}},
    "typewrite"=>{"*"=>{:past=>"typewrote", :past_participle=>"typewritten"}},
    "get"=>{"*"=>{:past=>"got", :past_participle=>"gotten"}},
    "stride"=>{"*"=>{:past=>"strode", :past_participle=>"stridden"}},
    "overcut"=>{"*"=>{:past=>"overcut", :past_participle=>"overcut"}},
    "understand"=>{"*"=>{:past=>"understood", :past_participle=>"understood"}},
    "outsit"=>{"*"=>{:past=>"outsat", :past_participle=>"outsat"}},
    "sign-on"=>{"*"=>{:past=>"signed-on", :past_participle=>"signed-on"}},
    "bite"=>{"*"=>{:past=>"bit", :past_participle=>"bitten"}},
    "reset"=>{"*"=>{:past=>"reset", :past_participle=>"reset"}},
    "lie"=>{"*"=>{:past=>"lied|lay", :past_participle=>"lied|lain"}},
    "step-up"=>{"*"=>{:past=>"stepped-up", :past_participle=>"stepped-up"}},
    "mislay"=>{"*"=>{:past=>"mislaid", :past_participle=>"mislaid"}},
    "inset"=>{"*"=>{:past=>"inset", :past_participle=>"inset"}},
    "spread"=>{"*"=>{:past=>"spread", :past_participle=>"spread"}},
    "premake"=>{"*"=>{:past=>"premade", :past_participle=>"premade"}},
    "rethink"=>{"*"=>{:past=>"rethought", :past_participle=>"rethought"}},
    "overspeak"=>{"*"=>{:past=>"overspoke", :past_participle=>"overspoken"}},
    "undo"=>
    {"third_person_singular"=>{:present=>"undoes"},
      "*"=>{:past=>"undid", :past_participle=>"undone"}},
    "swim"=>{"*"=>{:past=>"swam", :past_participle=>"swum"}},
    "unhide"=>{"*"=>{:past=>"unhid", :past_participle=>"unhidden"}},
    "resew"=>{"*"=>{:past=>"resewed", :past_participle=>"resewn"}},
    "intercut"=>{"*"=>{:past=>"intercut", :past_participle=>"intercut"}},
    "hear"=>{"*"=>{:past=>"heard", :past_participle=>"heard"}},
    "outspin"=>{"*"=>{:past=>"outspun", :past_participle=>"outspun"}},
    "sit"=>{"*"=>{:past=>"sat", :past_participle=>"sat"}},
    "uphold"=>{"*"=>{:past=>"upheld", :past_participle=>"upheld"}},
    "interbreed"=>{"*"=>{:past=>"interbred", :past_participle=>"interbred"}},
    "overwrite"=>{"*"=>{:past=>"overwrote", :past_participle=>"overwritten"}},
    "flee"=>{"*"=>{:past=>"fled", :past_participle=>"fled"}},
    "crossbreed"=>{"*"=>{:past=>"crossbred", :past_participle=>"crossbred"}},
    "prebuild"=>{"*"=>{:past=>"prebuilt", :past_participle=>"prebuilt"}},
    "re-make"=>{"*"=>{:past=>"re-made", :past_participle=>"re-made"}},
    "inweave"=>{"*"=>{:past=>"inwove", :past_participle=>"inwoven"}},
    "sight-read"=>{"*"=>{:past=>"sight-read", :past_participle=>"sight-read"}},
    "stepup"=>{"*"=>{:past=>"steppedup", :past_participle=>"steppedup"}},
    "throw"=>{"*"=>{:past=>"threw", :past_participle=>"thrown"}},
    "string"=>{"*"=>{:past=>"strung", :past_participle=>"strung"}},
    "outspring"=>{"*"=>{:past=>"outsprang", :past_participle=>"outsprung"}},
    "reknit"=>
    {"*"=>
      {:present_participle=>"reknitting",
        :past=>"reknitted",
        :past_participle=>"reknitted"}},
    "forerun"=>{"*"=>{:past=>"foreran", :past_participle=>"forerun"}},
    "grow"=>{"*"=>{:past=>"grew", :past_participle=>"grown"}},
    "wind"=>{"*"=>{:past=>"wound", :past_participle=>"wound"}},
    "overpay"=>{"*"=>{:past=>"overpaid", :past_participle=>"overpaid"}},
    "come"=>{"*"=>{:past=>"came", :past_participle=>"come"}},
    "outsing"=>{"*"=>{:past=>"outsang", :past_participle=>"outsung"}},
    "mislead"=>{"*"=>{:past=>"misled", :past_participle=>"misled"}},
    "misteach"=>{"*"=>{:past=>"mistaught", :past_participle=>"mistaught"}},
    "outrun"=>{"*"=>{:past=>"outran", :past_participle=>"outrun"}},
    "outshoot"=>{"*"=>{:past=>"outshot", :past_participle=>"outshot"}},
    "browbeat"=>{"*"=>{:past=>"browbeat", :past_participle=>"browbeaten"}},
    "wed"=>{"*"=>{:past=>"wed", :past_participle=>"wed"}},
    "testdrive"=>{"*"=>{:past=>"testdrove", :past_participle=>"testdriven"}},
    "mishear"=>{"*"=>{:past=>"misheard", :past_participle=>"misheard"}},
    "rewrite"=>{"*"=>{:past=>"rewrote", :past_participle=>"rewritten"}},
    "test-fly"=>{"*"=>{:past=>"test-flew", :past_participle=>"test-flown"}},
    "spring"=>{"*"=>{:past=>"sprang", :past_participle=>"sprung"}},
    "draw"=>{"*"=>{:past=>"drew", :past_participle=>"drawn"}},
    "feed"=>{"*"=>{:past=>"fed", :past_participle=>"fed"}},
    "sweep"=>{"*"=>{:past=>"swept", :past_participle=>"swept"}},
    "undergo"=>
    {"third_person_singular"=>{:present=>"undergoes"},
      "*"=>{:past=>"underwent", :past_participle=>"undergone"}},
    "wear"=>{"*"=>{:past=>"wore", :past_participle=>"worn"}},
    "misdeal"=>{"*"=>{:past=>"misdealt", :past_participle=>"misdealt"}},
    "lend"=>{"*"=>{:past=>"lent", :past_participle=>"lent"}},
    "recast"=>{"*"=>{:past=>"recast", :past_participle=>"recast"}},
    "outfly"=>{"*"=>{:past=>"outflew", :past_participle=>"outflown"}},
    "spin"=>{"*"=>{:past=>"spun", :past_participle=>"spun"}},
    "dive"=>{"*"=>{:past=>"dove", :past_participle=>"dived"}},
    "oversell"=>{"*"=>{:past=>"oversold", :past_participle=>"oversold"}},
    "overspread"=>{"*"=>{:past=>"overspread", :past_participle=>"overspread"}},
    "run"=>{"*"=>{:past=>"ran", :past_participle=>"run"}},
    "sandcast"=>{"*"=>{:past=>"sandcast", :past_participle=>"sandcast"}},
    "overstrike"=>{"*"=>{:past=>"overstruck", :past_participle=>"overstruck"}},
    "freeze"=>{"*"=>{:past=>"froze", :past_participle=>"frozen"}},
    "choose"=>{"*"=>{:past=>"chose", :past_participle=>"chosen"}},
    "fly"=>{"*"=>{:past=>"flew", :past_participle=>"flown"}},
    "slay"=>{"*"=>{:past=>"slew", :past_participle=>"slain"}},
    "outwind"=>{"*"=>{:past=>"outwound", :past_participle=>"outwound"}},
    "outgrow"=>{"*"=>{:past=>"outgrew", :past_participle=>"outgrown"}},
    "presplit"=>{"*"=>{:past=>"presplit", :past_participle=>"presplit"}},
    "lip-read"=>{"*"=>{:past=>"lip-read", :past_participle=>"lip-read"}},
    "spit"=>{"*"=>{:past=>"spat", :past_participle=>"spat"}},
    "sing"=>{"*"=>{:past=>"sang", :past_participle=>"sung"}},
    "hurt"=>{"*"=>{:past=>"hurt", :past_participle=>"hurt"}},
    "lose"=>{"*"=>{:past=>"lost", :past_participle=>"lost"}},
    "mistake"=>{"*"=>{:past=>"mistook", :past_participle=>"mistaken"}},
    "break"=>{"*"=>{:past=>"broke", :past_participle=>"broken"}},
    "feel"=>{"*"=>{:past=>"felt", :past_participle=>"felt"}},
    "self-feed"=>{"*"=>{:past=>"self-fed", :past_participle=>"self-fed"}},
    "unspin"=>{"*"=>{:past=>"unspun", :past_participle=>"unspun"}},
    "outdraw"=>{"*"=>{:past=>"outdrew", :past_participle=>"outdrawn"}},
    "fast-wind"=>{"*"=>{:past=>"fast-wound", :past_participle=>"fast-wound"}},
    "sub-let"=>{"*"=>{:past=>"sub-let", :past_participle=>"sub-let"}},
    "do"=>
    {"third_person_singular"=>{:present=>"does"},
      "*"=>{:past=>"did", :past_participle=>"done"}},
    "miswed"=>{"*"=>{:past=>"miswed", :past_participle=>"miswed"}},
    "outthrow"=>{"*"=>{:past=>"outthrew", :past_participle=>"outthrown"}},
    "wrought"=>{"*"=>{:past=>"wrought", :past_participle=>"wrought"}},
    "waylay"=>{"*"=>{:past=>"waylaid", :past_participle=>"waylaid"}},
    "quit"=>{"*"=>{:past=>"quit", :past_participle=>"quit"}},
    "prove"=>{"*"=>{:past=>"proved", :past_participle=>"proven"}},
    "fall"=>{"*"=>{:past=>"fell", :past_participle=>"fallen"}},
    "sink"=>{"*"=>{:past=>"sank", :past_participle=>"sunk"}},
    "retear"=>{"*"=>{:past=>"retore", :past_participle=>"retorn"}},
    "outwear"=>{"*"=>{:past=>"outwore", :past_participle=>"outworn"}},
    "rid"=>{"*"=>{:past=>"rid", :past_participle=>"rid"}},
    "bring"=>{"*"=>{:past=>"brought", :past_participle=>"brought"}},
    "tell"=>{"*"=>{:past=>"told", :past_participle=>"told"}},
    "write"=>{"*"=>{:past=>"wrote", :past_participle=>"written"}},
    "overspend"=>{"*"=>{:past=>"overspent", :past_participle=>"overspent"}},
    "wet"=>{"*"=>{:past=>"wet", :past_participle=>"wet"}},
    "thring"=>{"*"=>{:past=>"throng", :past_participle=>"throng"}},
    "think"=>{"*"=>{:past=>"thought", :past_participle=>"thought"}},
    "recut"=>{"*"=>{:past=>"recut", :past_participle=>"recut"}},
    "beset"=>{"*"=>{:past=>"beset", :past_participle=>"beset"}},
    "blow"=>{"*"=>{:past=>"blew", :past_participle=>"blown"}},
    "undershoot"=>{"*"=>{:past=>"undershot", :past_participle=>"undershot"}},
    "unstick"=>{"*"=>{:past=>"unstuck", :past_participle=>"unstuck"}},
    "unsay"=>{"*"=>{:past=>"unsaid", :past_participle=>"unsaid"}},
    "light"=>{"*"=>{:past=>"lit", :past_participle=>"lit"}},
    "wake"=>{"*"=>{:past=>"woke", :past_participle=>"woken"}},
    "outwrite"=>{"*"=>{:past=>"outwrote", :past_participle=>"outwritten"}},
    "retread"=>{"*"=>{:past=>"retrod", :past_participle=>"retrodden"}},
    "plead"=>{"*"=>{:past=>"pleaded", :past_participle=>"pled"}},
    "unweave"=>{"*"=>{:past=>"unwove", :past_participle=>"unwoven"}},
    "outsee"=>{"*"=>{:past=>"outsaw", :past_participle=>"outseen"}},
    "forsake"=>{"*"=>{:past=>"forsook", :past_participle=>"forsaken"}},
    "sand-cast"=>{"*"=>{:past=>"sand-cast", :past_participle=>"sand-cast"}},
    "overlay"=>{"*"=>{:past=>"overlaid", :past_participle=>"overlaid"}},
    "proofread"=>{"*"=>{:past=>"proofread", :past_participle=>"proofread"}},
    "slide"=>{"*"=>{:past=>"slid", :past_participle=>"slid"}},
    "preset"=>{"*"=>{:past=>"preset", :past_participle=>"preset"}},
    "strive"=>{"*"=>{:past=>"strove", :past_participle=>"striven"}},
    "read"=>{"*"=>{:past=>"read", :past_participle=>"read"}},
    "remake"=>{"*"=>{:past=>"remade", :past_participle=>"remade"}},
    "outtell"=>{"*"=>{:past=>"outtold", :past_participle=>"outtold"}},
    "selffeed"=>{"*"=>{:past=>"selffed", :past_participle=>"selffed"}},
    "misthink"=>{"*"=>{:past=>"misthought", :past_participle=>"misthought"}},
    "troubleshoot"=>
    {"*"=>{:past=>"troubleshot", :past_participle=>"troubleshot"}},
    "be"=>
    {"third_person_singular"=>{:present=>"is", :past=>"was"},
      "first_person_singular"=>{:present=>"am", :past=>"was"},
      "*"=>
      {:present_participle=>"being",
        :present=>"are",
        :past=>"were",
        :past_participle=>"been"}},
    "enwind"=>{"*"=>{:past=>"enwound", :past_participle=>"enwound"}},
    "interlay"=>{"*"=>{:past=>"interlaid", :past_participle=>"interlaid"}},
    "misspeak"=>{"*"=>{:past=>"misspoke", :past_participle=>"misspoken"}},
    "see"=>{"*"=>{:past=>"saw", :past_participle=>"seen"}},
    "unteach"=>{"*"=>{:past=>"untaught", :past_participle=>"untaught"}},
    "underbid"=>{"*"=>{:past=>"underbid", :past_participle=>"underbid"}},
    "overstride"=>
    {"*"=>{:past=>"overstrode", :past_participle=>"overstridden"}},
    "ride"=>{"*"=>{:past=>"rode", :past_participle=>"ridden"}},
    "overspring"=>{"*"=>{:past=>"oversprang", :past_participle=>"oversprung"}},
    "shoot"=>{"*"=>{:past=>"shot", :past_participle=>"shot"}},
    "spoon-feed"=>{"*"=>{:past=>"spoon-fed", :past_participle=>"spoon-fed"}},
    "hit"=>{"*"=>{:past=>"hit", :past_participle=>"hit"}},
    "unwind"=>{"*"=>{:past=>"unwound", :past_participle=>"unwound"}},
    "overbid"=>{"*"=>{:past=>"overbid", :past_participle=>"overbid"}},
    "overeat"=>{"*"=>{:past=>"overate", :past_participle=>"overeaten"}},
    "repay"=>{"*"=>{:past=>"repaid", :past_participle=>"repaid"}},
    "bleed"=>{"*"=>{:past=>"bled", :past_participle=>"bled"}},
    "underbuy"=>{"*"=>{:past=>"underbought", :past_participle=>"underbought"}},
    "unlay"=>{"*"=>{:past=>"unlaid", :past_participle=>"unlaid"}},
    "send"=>{"*"=>{:past=>"sent", :past_participle=>"sent"}},
    "overcast"=>{"*"=>{:past=>"overcast", :past_participle=>"overcast"}},
    "overbuy"=>{"*"=>{:past=>"overbought", :past_participle=>"overbought"}},
    "retake"=>{"*"=>{:past=>"retook", :past_participle=>"retaken"}},
    "forespeak"=>{"*"=>{:past=>"forespoke", :past_participle=>"forespoken"}},
    "sling"=>{"*"=>{:past=>"slung", :past_participle=>"slung"}},
    "handwrite"=>{"*"=>{:past=>"handwrote", :past_participle=>"handwritten"}},
    "foreknow"=>{"*"=>{:past=>"foreknew", :past_participle=>"foreknown"}},
    "underwrite"=>
    {"*"=>{:past=>"underwrote", :past_participle=>"underwritten"}},
    "overlie"=>{"*"=>{:past=>"overlay", :past_participle=>"overlain"}},
    "steal"=>{"*"=>{:past=>"stole", :past_participle=>"stolen"}},
    "miswear"=>{"*"=>{:past=>"miswore", :past_participle=>"misworn"}},
    "slit"=>{"*"=>{:past=>"slit", :past_participle=>"slit"}},
    "overstand"=>{"*"=>{:past=>"overstood", :past_participle=>"overstood"}},
    "undertake"=>{"*"=>{:past=>"undertook", :past_participle=>"undertaken"}},
    "know"=>{"*"=>{:past=>"knew", :past_participle=>"known"}},
    "rehear"=>{"*"=>{:past=>"reheard", :past_participle=>"reheard"}},
    "overstring"=>{"*"=>{:past=>"overstrung", :past_participle=>"overstrung"}},
    "ring"=>{"*"=>{:past=>"rang", :past_participle=>"rung"}},
    "become"=>{"*"=>{:past=>"became", :past_participle=>"become"}},
    "re-tell"=>{"*"=>{:past=>"re-told", :past_participle=>"re-told"}},
    "outthink"=>{"*"=>{:past=>"outthought", :past_participle=>"outthought"}},
    "overbreed"=>{"*"=>{:past=>"overbred", :past_participle=>"overbred"}},
    "rise"=>{"*"=>{:past=>"rose", :past_participle=>"risen"}},
    "sting"=>{"*"=>{:past=>"stung", :past_participle=>"stung"}},
    "bethink"=>{"*"=>{:past=>"bethought", :past_participle=>"bethought"}},
    "redeal"=>{"*"=>{:past=>"redealt", :past_participle=>"redealt"}},
    "miswrite"=>{"*"=>{:past=>"miswrote", :past_participle=>"miswritten"}},
    "begin"=>{"*"=>{:past=>"began", :past_participle=>"begun"}},
    "foretell"=>{"*"=>{:past=>"foretold", :past_participle=>"foretold"}},
    "rewin"=>{"*"=>{:past=>"rewon", :past_participle=>"rewon"}},
    "hang"=>{"*"=>{:past=>"hanged|hung", :past_participle=>"hanged|hung"}},
    "mishit"=>{"*"=>{:past=>"mishit", :past_participle=>"mishit"}},
    "shut"=>{"*"=>{:past=>"shut", :past_participle=>"shut"}},
    "missend"=>{"*"=>{:past=>"missent", :past_participle=>"missent"}},
    "hold"=>{"*"=>{:past=>"held", :past_participle=>"held"}},
    "outride"=>{"*"=>{:past=>"outrode", :past_participle=>"outridden"}},
    "typecast"=>{"*"=>{:past=>"typecast", :past_participle=>"typecast"}},
    "unstring"=>{"*"=>{:past=>"unstrung", :past_participle=>"unstrung"}},
    "speak"=>{"*"=>{:past=>"spoke", :past_participle=>"spoken"}},
    "dig"=>{"*"=>{:past=>"dug", :past_participle=>"dug"}},
    "meet"=>{"*"=>{:past=>"met", :past_participle=>"met"}},
    "go"=>
    {"third_person_singular"=>{:present=>"goes"},
      "*"=>{:past=>"went", :past_participle=>"gone"}},
    "stink"=>{"*"=>{:past=>"stank", :past_participle=>"stunk"}},
    "interwind"=>{"*"=>{:past=>"interwound", :past_participle=>"interwound"}},
    "overbuild"=>{"*"=>{:past=>"overbuilt", :past_participle=>"overbuilt"}},
    "set"=>{"*"=>{:past=>"set", :past_participle=>"set"}},
    "inbring"=>{"*"=>{:past=>"inbrought", :past_participle=>"inbrought"}},
    "outspeak"=>{"*"=>{:past=>"outspoke", :past_participle=>"outspoken"}},
    "overwind"=>{"*"=>{:past=>"overwound", :past_participle=>"overwound"}},
    "welcome"=>{"*"=>{:past=>"welcomed", :past_participle=>"welcomed"}},
    "give"=>{"*"=>{:past=>"gave", :past_participle=>"given"}},
    "forbid"=>{"*"=>{:past=>"forbade", :past_participle=>"forbidden"}},
    "mistell"=>{"*"=>{:past=>"mistold", :past_participle=>"mistold"}},
    "retrofit"=>{"*"=>{:past=>"retrofit", :past_participle=>"retrofit"}},
    "hand-feed"=>{"*"=>{:past=>"hand-fed", :past_participle=>"hand-fed"}},
    "sew"=>{"*"=>{:past=>"sewed", :past_participle=>"sewn"}},
    "use-up"=>
    {"*"=>
      {:present_participle=>"using-up",
        :past=>"used-up",
        :past_participle=>"used-up"}},
    "unthink"=>{"*"=>{:past=>"unthought", :past_participle=>"unthought"}},
    "forget"=>{"*"=>{:past=>"forgot", :past_participle=>"forgotten"}},
    "rewind"=>{"*"=>{:past=>"rewound", :past_participle=>"rewound"}},
    "sublet"=>{"*"=>{:past=>"sublet", :past_participle=>"sublet"}},
    "overfeed"=>{"*"=>{:past=>"overfed", :past_participle=>"overfed"}},
    "unhang"=>{"*"=>{:past=>"unhung", :past_participle=>"unhung"}},
    "unhold"=>{"*"=>{:past=>"unheld", :past_participle=>"unheld"}},
    "underrun"=>{"*"=>{:past=>"underran", :past_participle=>"underrun"}},
    "loop-up"=>{"*"=>{:past=>"looped-up", :past_participle=>"looped-up"}},
    "underfeed"=>{"*"=>{:past=>"underfed", :past_participle=>"underfed"}},
    "bet"=>{"*"=>{:past=>"bet", :past_participle=>"bet"}},
    "rebuild"=>{"*"=>{:past=>"rebuilt", :past_participle=>"rebuilt"}},
    "betake"=>{"*"=>{:past=>"betook", :past_participle=>"betaken"}},
    "unfreeze"=>{"*"=>{:past=>"unfroze", :past_participle=>"unfrozen"}},
    "refit"=>{"*"=>{:past=>"refit", :past_participle=>"refit"}},
    "befall"=>{"*"=>{:past=>"befell", :past_participle=>"befallen"}},
    "overrun"=>{"*"=>{:past=>"overran", :past_participle=>"overrun"}},
    "swing"=>{"*"=>{:past=>"swung", :past_participle=>"swung"}},
    "under-write"=>
    {"*"=>{:past=>"under-wrote", :past_participle=>"under-written"}},
    "test-drive"=>{"*"=>{:past=>"test-drove", :past_participle=>"test-driven"}},
    "awake"=>{"*"=>{:past=>"awoke", :past_participle=>"awoken"}},
    "stallfeed"=>{"*"=>{:past=>"stallfed", :past_participle=>"stallfed"}},
    "upset"=>{"*"=>{:past=>"upset", :past_participle=>"upset"}},
    "let"=>{"*"=>{:past=>"let", :past_participle=>"let"}},
    "backslide"=>{"*"=>{:past=>"backslid", :past_participle=>"backslid"}},
    "stall-feed"=>{"*"=>{:past=>"stall-fed", :past_participle=>"stall-fed"}},
    "build"=>{"*"=>{:past=>"built", :past_participle=>"built"}},
    "misread"=>{"*"=>{:past=>"misread", :past_participle=>"misread"}},
    "swear"=>{"*"=>{:past=>"swore", :past_participle=>"sworn"}},
    "outsell"=>{"*"=>{:past=>"outsold", :past_participle=>"outsold"}},
    "relay"=>{"*"=>{:past=>"relaid", :past_participle=>"relaid"}},
    "misspend"=>{"*"=>{:past=>"misspent", :past_participle=>"misspent"}},
    "inlay"=>{"*"=>{:past=>"inlaid", :past_participle=>"inlaid"}},
    "reweave"=>{"*"=>{:past=>"rewove", :past_participle=>"rewoven"}},
    "reteach"=>{"*"=>{:past=>"retaught", :past_participle=>"retaught"}},
    "trail-off"=>{"*"=>{:past=>"trailed-off", :past_participle=>"trailed-off"}},
    "undraw"=>{"*"=>{:past=>"undrew", :past_participle=>"undrawn"}},
    "overwear"=>{"*"=>{:past=>"overwore", :past_participle=>"overworn"}},
    "outswear"=>{"*"=>{:past=>"outswore", :past_participle=>"outsworn"}},
    "preshrink"=>{"*"=>{:past=>"preshrank", :past_participle=>"preshrunk"}},
    "unwrite"=>{"*"=>{:past=>"unwrote", :past_participle=>"unwritten"}},
    "overtake"=>{"*"=>{:past=>"overtook", :past_participle=>"overtaken"}},
    "forgive"=>{"*"=>{:past=>"forgave", :past_participle=>"forgiven"}},
    "rebid"=>{"*"=>{:past=>"rebid", :past_participle=>"rebid"}},
    "eye"=>{"*"=>{:present_participle=>"eyeing"}},
    "overdrink"=>{"*"=>{:past=>"overdrank", :past_participle=>"overdrunk"}},
    "regrind"=>{"*"=>{:past=>"reground", :past_participle=>"reground"}},
    "foreswear"=>{"*"=>{:past=>"foreswore", :past_participle=>"foresworn"}},
    "find"=>{"*"=>{:past=>"found", :past_participle=>"found"}},
    "cling"=>{"*"=>{:past=>"clung", :past_participle=>"clung"}},
    "bind"=>{"*"=>{:past=>"bound", :past_participle=>"bound"}},
    "regrow"=>{"*"=>{:past=>"regrew", :past_participle=>"regrown"}},
    "outstand"=>{"*"=>{:past=>"outstood", :past_participle=>"outstood"}},
    "redo"=>
    {"third_person_singular"=>{:present=>"redoes"},
      "*"=>{:past=>"redid", :past_participle=>"redone"}},
    "overspeed"=>{"*"=>{:past=>"oversped", :past_participle=>"oversped"}},
    "overhear"=>{"*"=>{:past=>"overheard", :past_participle=>"overheard"}},
    "oversleep"=>{"*"=>{:past=>"overslept", :past_participle=>"overslept"}},
    "sell"=>{"*"=>{:past=>"sold", :past_participle=>"sold"}},
    "overstrive"=>{"*"=>{:past=>"overstrove", :past_participle=>"overstriven"}},
    "backbite"=>{"*"=>{:past=>"backbit", :past_participle=>"backbitten"}},
    "prepay"=>{"*"=>{:past=>"prepaid", :past_participle=>"prepaid"}},
    "spend"=>{"*"=>{:past=>"spent", :past_participle=>"spent"}},
    "redraw"=>{"*"=>{:past=>"redrew", :past_participle=>"redrawn"}},
    "retell"=>{"*"=>{:past=>"retold", :past_participle=>"retold"}},
    "misunderstand"=>
    {"*"=>{:past=>"misunderstood", :past_participle=>"misunderstood"}},
    "creep"=>{"*"=>{:past=>"crept", :past_participle=>"crept"}},
    "arise"=>{"*"=>{:past=>"arose", :past_participle=>"arisen"}},
    "bear"=>{"*"=>{:past=>"bore", :past_participle=>"borne"}},
    "have"=>
    {"third_person_singular"=>{:present=>"has"},
      "*"=>
      {:present_participle=>"having",
        :present=>"have",
        :past=>"had",
        :past_participle=>"had"}},
    "shear"=>{"*"=>{:past=>"shore", :past_participle=>"shorn"}},
    "gainsay"=>{"*"=>{:past=>"gainsaid", :past_participle=>"gainsaid"}},
    "split"=>{"*"=>{:past=>"split", :past_participle=>"split"}},
    "cost"=>{"*"=>{:past=>"cost", :past_participle=>"cost"}},
    "overcome"=>{"*"=>{:past=>"overcame", :past_participle=>"overcome"}},
    "forbear"=>{"*"=>{:past=>"forbore", :past_participle=>"forborne"}},
    "rebroadcast"=>
    {"*"=>{:past=>"rebroadcast", :past_participle=>"rebroadcast"}},
    "tread"=>{"*"=>{:past=>"trod", :past_participle=>"trodden"}},
    "outspend"=>{"*"=>{:past=>"outspent", :past_participle=>"outspent"}},
    "beat"=>{"*"=>{:past=>"beat", :past_participle=>"beaten"}},
    "drink"=>{"*"=>{:past=>"drank", :past_participle=>"drunk"}},
    "leave"=>{"*"=>{:past=>"left", :past_participle=>"left"}},
    "oversee"=>{"*"=>{:past=>"oversaw", :past_participle=>"overseen"}},
    "light-up"=>{"*"=>{:past=>"lit-up", :past_participle=>"lit-up"}},
    "skywrite"=>{"*"=>{:past=>"skywrote", :past_participle=>"skywritten"}},
    "cut"=>{"*"=>{:past=>"cut", :past_participle=>"cut"}},
    "re-lay"=>{"*"=>{:past=>"re-laid", :past_participle=>"re-laid"}},
    "overdraw"=>{"*"=>{:past=>"overdrew", :past_participle=>"overdrawn"}},
    "resend"=>{"*"=>{:past=>"resent", :past_participle=>"resent"}},
    "build-up"=>{"*"=>{:past=>"built-up", :past_participle=>"built-up"}},
    "overspin"=>{"*"=>{:past=>"overspun", :past_participle=>"overspun"}},
    "override"=>{"*"=>{:past=>"overrode", :past_participle=>"overridden"}},
    "overthrow"=>{"*"=>{:past=>"overthrew", :past_participle=>"overthrown"}},
    "landslide"=>{"*"=>{:past=>"landslid", :past_participle=>"landslid"}},
    "rewed"=>{"*"=>{:past=>"rewed", :past_participle=>"rewed"}},
    "kneel"=>{"*"=>{:past=>"knelt", :past_participle=>"knelt"}},
    "jerry-build"=>
    {"*"=>{:past=>"jerry-built", :past_participle=>"jerry-built"}},
    "presell"=>{"*"=>{:past=>"presold", :past_participle=>"presold"}},
    "catch"=>{"*"=>{:past=>"caught", :past_participle=>"caught"}},
    "underspend"=>{"*"=>{:past=>"underspent", :past_participle=>"underspent"}},
    "broadcast"=>{"*"=>{:past=>"broadcast", :past_participle=>"broadcast"}},
    "make-out"=>
    {"*"=>
      {:present_participle=>"making-out",
        :past=>"made-out",
        :past_participle=>"made-out"}},
    "weep"=>{"*"=>{:past=>"wept", :past_participle=>"wept"}},
    "rerun"=>{"*"=>{:past=>"reran", :past_participle=>"rerun"}},
    "fight"=>{"*"=>{:past=>"fought", :past_participle=>"fought"}},
    "fit-out"=>{"*"=>{:past=>"fitted-out", :past_participle=>"fitted-out"}},
    "stand"=>{"*"=>{:past=>"stood", :past_participle=>"stood"}},
    "rehang"=>{"*"=>{:past=>"rehung", :past_participle=>"rehung"}},
    "smite"=>{"*"=>{:past=>"smote", :past_participle=>"smitten"}},
    "mean"=>{"*"=>{:past=>"meant", :past_participle=>"meant"}},
    "pay"=>{"*"=>{:past=>"paid", :past_participle=>"paid"}},
    "re-sell"=>{"*"=>{:past=>"re-sold", :past_participle=>"re-sold"}},
    "miscut"=>{"*"=>{:past=>"miscut", :past_participle=>"miscut"}},
    "overdrive"=>{"*"=>{:past=>"overdrove", :past_participle=>"overdriven"}},
    "breed"=>{"*"=>{:past=>"bred", :past_participle=>"bred"}},
    "shake"=>{"*"=>{:past=>"shook", :past_participle=>"shaken"}},
    "seek"=>{"*"=>{:past=>"sought", :past_participle=>"sought"}},
    "fling"=>{"*"=>{:past=>"flung", :past_participle=>"flung"}},
    "outfight"=>{"*"=>{:past=>"outfought", :past_participle=>"outfought"}},
    "misswear"=>{"*"=>{:past=>"misswore", :past_participle=>"missworn"}},
    "half-rise"=>{"*"=>{:past=>"half-rose", :past_participle=>"half-risen"}},
    "bend"=>{"*"=>{:past=>"bent", :past_participle=>"bent"}},
    "colorbreed"=>{"*"=>{:past=>"colorbred", :past_participle=>"colorbred"}},
    "outdrink"=>{"*"=>{:past=>"outdrank", :past_participle=>"outdrunk"}},
    "offset"=>{"*"=>{:past=>"offset", :past_participle=>"offset"}},
    "overset"=>{"*"=>{:past=>"overset", :past_participle=>"overset"}},
    "carry-out"=>{"*"=>{:past=>"carried-out", :past_participle=>"carried-out"}},
    "testfly"=>{"*"=>{:past=>"testflew", :past_participle=>"testflown"}},
    "forsee"=>{"*"=>{:past=>"forsaw", :past_participle=>"forseen"}},
    "thrust"=>{"*"=>{:past=>"thrust", :past_participle=>"thrust"}},
    "hagride"=>{"*"=>{:past=>"hagrode", :past_participle=>"hagridden"}},
    "cast"=>{"*"=>{:past=>"cast", :past_participle=>"cast"}},
    "put"=>{"*"=>{:past=>"put", :past_participle=>"put"}},
    "hamstring"=>{"*"=>{:past=>"hamstrung", :past_participle=>"hamstrung"}},
    "make"=>{"*"=>{:past=>"made", :past_participle=>"made"}},
    "win"=>{"*"=>{:past=>"won", :past_participle=>"won"}},
    "sightread"=>{"*"=>{:past=>"sightread", :past_participle=>"sightread"}},
    "interset"=>{"*"=>{:past=>"interset", :past_participle=>"interset"}},
    "misdo"=>{"*"=>{:past=>"misdid", :past_participle=>"misdone"}},
    "shed"=>{"*"=>{:past=>"shed", :past_participle=>"shed"}},
    "quickfreeze"=>
    {"*"=>{:past=>"quickfroze", :past_participle=>"quickfrozen"}},
    "beget"=>{"*"=>{:past=>"begat", :past_participle=>"begot"}},
    "misbecome"=>{"*"=>{:past=>"misbecame", :past_participle=>"misbecome"}},
    "rewet"=>{"*"=>{:past=>"rewet", :past_participle=>"rewet"}},
    "pie"=>{"*"=>{:present_participle=>"pieing"}},
    "unsling"=>{"*"=>{:past=>"unslung", :past_participle=>"unslung"}},
    "wring"=>{"*"=>{:past=>"wrung", :past_participle=>"wrung"}},
    "drive"=>{"*"=>{:past=>"drove", :past_participle=>"driven"}},
    "tear"=>{"*"=>{:past=>"tore", :past_participle=>"torn"}},
    "forego"=>{"*"=>{:past=>"forewent", :past_participle=>"foregone"}},
    "strike"=>{"*"=>{:past=>"struck", :past_participle=>"struck"}},
    "telecast"=>{"*"=>{:past=>"telecast", :past_participle=>"telecast"}},
    "overhang"=>{"*"=>{:past=>"overhung", :past_participle=>"overhung"}},
    "teach"=>{"*"=>{:past=>"taught", :past_participle=>"taught"}},
    "weave"=>{"*"=>{:past=>"wove", :past_participle=>"woven"}},
    "say"=>{"*"=>{:past=>"said", :past_participle=>"said"}},
    "kick-off"=>
    {"*"=>
      {:present_participle=>"kicking-off",
        :past=>"kicked-off",
        :past_participle=>"kicked-off"}},
    "spoonfeed"=>{"*"=>{:past=>"spoonfed", :past_participle=>"spoonfed"}},
    "dye"=>{"*"=>{:present_participle=>"dyeing"}},
    "miscast"=>{"*"=>{:past=>"miscast", :past_participle=>"miscast"}},
    "outdo"=>
    {"third_person_singular"=>{:present=>"outdoes"},
      "*"=>{:past=>"outdid", :past_participle=>"outdone"}},
    "unsew"=>{"*"=>{:past=>"unsewed", :past_participle=>"unsewn"}},
    "overthink"=>{"*"=>{:past=>"overthought", :past_participle=>"overthought"}},
    "lead"=>{"*"=>{:past=>"led", :past_participle=>"led"}},
    "quick-freeze"=>
    {"*"=>{:past=>"quick-froze", :past_participle=>"quick-frozen"}},
    "overdo"=>{"*"=>{:past=>"overdid", :past_participle=>"overdone"}},
    "overbear"=>{"*"=>{:past=>"overbore", :past_participle=>"overborne"}},
    "grind"=>{"*"=>{:past=>"ground", :past_participle=>"ground"}}
  }
  
  DOUBLING_VERBS = 'abat abet abhor abut accur acquit adlib admit aerobat aerosol agendaset airdrop allot alot anagram annul appal apparel armbar aver babysit backdrop backfil backflip backlog backpedal backslap backstab bag balfun ballot ban bar barbel bareleg barrel bat bayonet becom bed bedevil bedwet beenhop befit befog beg beget begin bejewel bemedal benefit benum beset besot bestir bet betassel bevel bewig bib bid billet bin bip bit bitmap blab blackleg blag blam blan blat bles blim blip blob bloodlet blot blub blur bob bobsled bodypop bog boobytrap booksel bootleg bop bot bowel bracket brag brig brim bud buffet bug bullshit bum bun bur bus but cab cabal cam can cancel cap caracol caravan carburet carnap carol carpetbag castanet cat catcal catnap cavil chan chanel channel chap char chargecap chat chin chip chir chirrup chisel chop chug chum chur clam clap clearcut clip clodhop clog clop closet clot club cob cobweb cod coif com combat comit commit compel con concur confab confer confiscat control cooccur cop coprogram coquet coral corbel corefer corral corun cosset costar cotransmit councel council counsel counterplot courtmartial crab cram crap crib crop crossleg cub cudgel cum cun cup curet cut dab dag dam dan dap daysit deadpan debag debar debug decommit decontrol defer defog deg degas degazet dehul deinstal demit demob demur den denet depig depip depit deprogram der derig deskil deter devil diagram dial dib dig dim din dip disbar disbud discomfit disembed disembowel dishevel disinter dispel disprefer distil dog dognap don doorstep dot dowel drag drat driftnet drip drivel drop drub drug drum dub duel dun dybbuk earwig eavesdrop ecolabel egotrip eitherspigot electroblot embed emit empanel enamel endlabel endtrim enrol enthral entrammel entrap enwrap equal equip estop exaggerat excel expel extol fag fan farewel fat featherbed feget fet fib fig fin fingerspel fingertip fit flab flag flap flip flit flog flop fob focus fog footbal footslog fop forbid forget format fortunetel fot foxtrot frag freefal fret frig frip frog frug fuel fufil fulfil fullyfit fun funnel fur furpul gab gad gaffe gag gam gambol gap garot garrot gas gat gel gen get giftwrap gig gimbal gin glam glenden glendin globetrot glug glut gob goldpan golliwog goostep gossip grab gravel grid grin grip grit groundhop grovel grub gum gun gunrun gut gyp haircut ham han handbag handicap handknit handset hap hareleg hat headbut hedgehop hem hen hiccup highwal hip hit hobnob hog hop horsewhip hostel hot hotdog hovel hug hum humbug hup hushkit hut idyl illfit imbed immunblot immunoblot impannel impel imperil incur infer infil inflam initial input inset inspan instal instil inter interbed intercrop intercut interfer intermit interwar jab jag jam japan jar jawdrop jet jetlag jewel jib jig jitterbug job jog jogtrot jot jug jut ken kennel kid kidnap kip kissogram kit knap kneecap knit knob knot kor kris label lag lam lap lavel leafcut leapfrog leg lem lep let level libel lid lig lip lob log lok lollop longleg lop lowbal lug mackerel mahom man manumit map mar marshal marvel mat matchwin metal microplan microprogram milksop miscal misclub mishit mislabel misspel mit mob mod model mohmam monogram mop mothbal mousse mud mug multilevel mum nab nag nan nap net nightclub nightsit nip nod nonplus norkop nostril not nut nutmeg occur ocur offput offset omit ommit onlap outbid outcrop outfit outgas outgeneral outgun outhit outjab outplan outpol outpul output outrun outsel outship outshop outsin outspan outstrip outswel outwit overbid overcal overcommit overcontrol overcrap overcrop overdub overfil overfit overhat overhit overlap overman overmodel overpedal overpet overplot overrun oversel overshop overstep overtip overtop overwet overwil pad paintbal pan panel paperclip par parallel parcel partiescal pat patrol pedal peewit peg pen pencil pep permit pet petal pettifog photoset photostat phototypeset phut picket pig pilot pin pinbal pip pipefit pipet pit plan plit plod plop plot plug plumet plummet pod policyset polyfil ponytrek pop pot pouf pram prebag predistil predril prefer prefil preinstal prep preplan preprogram preset prim prizewin prod profer prog program prop propel pub pug pummel pun pup pushfit put quarel quarrel quickskim quickstep quickwit quip quit quivertip quiz rabbit rabit radiolabel rag ram ramrod rap rat ratecap ravel readmit reallot rebel rebid rebin rebut recal recap rechannel recommit recrop recur recut red redig redril reemit refer refil refit reflag reformat refret refuel reget regret rehab reinstal reinter rejig rekit reknot relabel relap relet rem remap remetal remit remodel reoccur rep repastel repel repin replan replot replug repol repot reprogram rerefer rerig rerol rerun resel reset resignal resit reskil reskin restal resubmit ret retel retop retransfer retransmit retrim retrofit rev revel revet rewrap rib richochet ricochet rid rig rim ringlet rip rit rival rivet roadrun rob rocket rod roset rosin rot rowel rub run runnel rut sab sad sag sandbag sap scab scalpel scam scan scar scat schlep scrag scram scrap scrat scrub scrum scud scum scur semicontrol semiskil semiskim sentinel set shag shall sham shed shim shin ship shir shit shlap shop shopfit shortfal shot shovel shred shrinkwrap shrivel shrug shun shut sideslip sidestep signal sin sinbin sip sit skid skim skin skip skir skrag slab slag slam slap sled slim slip slit slob slog slop slot slowclap slug slum slur smit smut snag snap snip snivel snog snorkel snowcem snub snug sob sod softpedal son sop spam span spar spat spiderweb spin spiral spit splat split spot sprag spraygun sprig springtip spud spur squat squirrel stab stag star stem sten stencil step stet stir stop storytel strap strim strip strop strug strum strut stub stud stun sub subcrop sublet submit subset suedetrim sulfuret sum summit sun suntan sup superad superchil swab swag swan swap swat swig swim swivel swot tab tag tan tansfer tap tar tassel tat tefer teleshop tendril terschel thermal thermostat thin throb thrum thud thug tightlip tin tinsel tip tittup toecap tog tom tomorrow top tot total towel traget trainspot tram trammel transfer tranship transit transmit transship trap travel trek trendset trepan trim trip tripod trod trog trot trousseaushop trowel trup tub tug tunnel tup tut twat twig twin twit typeset tyset unban unbar unbob uncap unclip uncompel undam underbid underbil undercut underfit underlet underman underpin underskil unfit unfulfil unknot unlip unlywil unman unpad unpeg unpin unplug unravel unrip unrol unscrol unsnap unstal unstep unstir unstop untap unwrap unzip up upset upskil upwel ven verbal vet victual vignet wad wag wainscot wan war waterfal waterfil waterlog weasel web wed wet wham whet whip whir whiteskin whiz whop whup wig wildcat will win windmil wiretap wit woodchop woodcut wor worship wrap yak yap yarnspin yen yip yodel zag zap zig zigzag zip ztrip'.split
    
  #  
  #  This is the gateway to conjugating verbs.
  #
  def conjugate(tense, person = nil)
    conjugation(self.obj.to_s, tense, person)
  end

  #Some Helper Functions (force first person
  def past
    conjugation(self.obj.to_s, :past)
  end
  
  def past_participle
    conjugation(self.obj.to_s, :past_participle)
  end
  
  def present
    conjugation(self.obj.to_s, :present)
  end
  
  def present_participle
    conjugation(self.obj.to_s, :present_participle)
  end
  
   
  private 
  
  #
  # Receives an infinitive, tense, and person -- Returns a conjugated verb
  #
  def conjugation (infinitive, tense, person = nil)
    
    verb = infinitive.downcase
    
    result = get_irregular(verb, person, tense)
    return result unless result.nil?

    result = case tense
      when :present then conjugate_present(verb, person)
      when :present_participle then conjugate_present_participle(verb)
      when :past then conjugate_past(verb)
      when :past_participle then conjugate_past_participle(verb)
      else raise "Unknown Tense"
      end
    
    return result.nil? ? verb : result    
  end
  
  def conjugate_present(verb, person)
    if (person == :third_person_singular)
      if (verb.match( ".*(ch|s|sh|x|z)$" ))
        verb += "es"
      elsif (verb.match( ".*(ay|ey|oy|uy)$"))
        verb += "s"
      elsif (verb.match( ".*[^aeiou]y" ))
        verb = verb[0..(verb.length - 1)] + "ies"
      else
        verb += "s"
      end
      return verb
    else
      return nil
    end
  end
  
  def conjugate_present_participle(verb)
    if ( verb.match( ".*[^aeiou]e" ) )
      verb = verb[0..(verb.length - 1)]
    elsif ( verb.match( "ie$" ) )
      verb = verb[0..(verb.length - 2 )] + "y"
    elsif ( verb.match( ".*[aou]e" ) )
      verb = verb[0..(verb.length - 1)]
    elsif ( DOUBLING_VERBS.include? verb )
      verb += verb[(verb.length - 1)..verb.length]
    end
    verb += "ing";
  end
  
  def conjugate_past(verb)
    conjugate_past_participle(verb)
  end
  
  def conjugate_past_participle(verb)
    if ( verb.match("e$") )
      verb  += "d"
    elsif ( verb.match( ".*[^aeiou]y" ) )
      verb = verb[0..(verb.length - 1)] + "ied";
    else
      if ( DOUBLING_VERBS.include? verb )
        verb += verb[(verb.length - 1)..verb.length]
      end
      verb += "ed";
    end
    return verb
  end
  
  #
  # checks irregular verb hash for a match, returns nil if none found
  #
  def get_irregular(verb, person, tense)
    #verb an irregular?
    irregular = IRREGULAR_VERBS[verb]
    return nil unless !irregular.nil?
    
    #see if specific person match
    if !irregular[person].nil?
      result = irregular[person][tense]
    end  
    return result unless result.nil?
    
    if !irregular["*"].nil?
      result = irregular["*"][tense]
    end
    return result    
  end
end
