#!/usr/bin/env rspec -cfd
#coding: utf-8

require_relative '../../helpers'

require 'rspec'

require 'linguistics'
require 'linguistics/en'
require 'linguistics/en/titlecase'


describe Linguistics::EN::TitleCase do

	before( :all ) do
		Linguistics.use( :en )
	end

	it "adds EN::TitleCase to the list of English language modules" do
		Linguistics::EN::MODULES.include?( Linguistics::EN::TitleCase )
	end

	it "CamelCases 'motion is madness' correctly" do
		"motion is madness".en.to_camel_case.should == 'motionIsMadness'
	end

	it "CamelCases 'Special Verb Case' correctly" do
		"Special Verb Case".en.to_camel_case.should == 'SpecialVerbCase'
	end

	it "un-CamelCases 'motionIsMadness' correctly" do
		"motionIsMadness".en.un_camel_case.should == 'motion is madness'
	end

	it "un-CamelCases 'ASpecialVerbCase' correctly" do
		"ASpecialVerbCase".en.un_camel_case.should == 'a special verb case'
	end

	it "titlecases _Absalom, Absalom!_ correctly" do
		%{Absalom, Absalom!}.downcase.en.titlecase.should == %{Absalom, Absalom!}
	end

	it "titlecases _After Many a Summer Dies the Swan_ correctly" do
		%{After Many a Summer Dies the Swan}.downcase.en.titlecase.
			should == %{After Many a Summer Dies the Swan}
	end

	it "titlecases _Ah, Wilderness!_ correctly" do
		%{Ah, Wilderness!}.downcase.en.titlecase.should == %{Ah, Wilderness!}
	end

	it "titlecases _Alien Corn_ correctly" do
		%{Alien Corn}.downcase.en.titlecase.should == %{Alien Corn}
	end

	it "titlecases _The Alien Corn_ correctly" do
		%{The Alien Corn}.downcase.en.titlecase.
			should == %{The Alien Corn}
	end

	it "titlecases _All Passion Spent_ correctly" do
		%{All Passion Spent}.downcase.en.titlecase.should == %{All Passion Spent}
	end

	it "titlecases _All the King's Men_ correctly" do
		%{All the King's Men}.downcase.en.titlecase.should == %{All the King's Men}
	end

	it "titlecases _Alone on a Wide, Wide Sea_ correctly" do
		%{Alone on a Wide, Wide Sea}.downcase.en.titlecase.should == %{Alone on a Wide, Wide Sea}
	end

	it "titlecases _An Acceptable Time_ correctly" do
		%{An Acceptable Time}.downcase.en.titlecase.should == %{An Acceptable Time}
	end

	it "titlecases _Antic Hay_ correctly" do
		%{Antic Hay}.downcase.en.titlecase.should == %{Antic Hay}
	end

	it "titlecases _An Evil Cradling_ correctly" do
		%{An Evil Cradling}.downcase.en.titlecase.should == %{An Evil Cradling}
	end

	it "titlecases _Arms and the Man_ correctly" do
		%{Arms and the Man}.downcase.en.titlecase.
			should == %{Arms and the Man}
	end

	it "titlecases _As I Lay Dying_ correctly" do
		%{As I Lay Dying}.downcase.en.titlecase.
			should == %{As I Lay Dying}
	end

	it "titlecases _A Time to Kill_ correctly" do
		%{A Time to Kill}.downcase.en.titlecase.
			should == %{A Time to Kill}
	end

	it "titlecases _Behold the Man_ correctly" do
		%{Behold the Man}.downcase.en.titlecase.
			should == %{Behold the Man}
	end

	it "titlecases _Beneath the Bleeding_ correctly" do
		%{Beneath the Bleeding}.downcase.en.titlecase.
			should == %{Beneath the Bleeding}
	end

	it "titlecases _Beyond the Mexique Bay_ correctly" do
		%{Beyond the Mexique Bay}.downcase.en.titlecase.
			should == %{Beyond the Mexique Bay}
	end

	it "titlecases _Blithe Spirit_ correctly" do
		%{Blithe Spirit}.downcase.en.titlecase.
			should == %{Blithe Spirit}
	end

	it "titlecases _Blood's a Rover_ correctly" do
		%{Blood's a Rover}.downcase.en.titlecase.
			should == %{Blood's a Rover}
	end

	it "titlecases _Boats Against the Current_ correctly" do
		%{Boats Against the Current}.downcase.en.titlecase.
			should == %{Boats Against the Current}
	end

	it "titlecases _Bonjour Tristesse_ correctly" do
		%{Bonjour Tristesse}.downcase.en.titlecase.
			should == %{Bonjour Tristesse}
	end

	it "titlecases _Brandy of the Damned_ correctly" do
		%{Brandy of the Damned}.downcase.en.titlecase.
			should == %{Brandy of the Damned}
	end

	it "titlecases _Bury My Heart at Wounded Knee_ correctly" do
		%{Bury My Heart at Wounded Knee}.downcase.en.titlecase.
			should == %{Bury My Heart at Wounded Knee}
	end

	it "titlecases _Cabbages and Kings_ correctly" do
		%{Cabbages and Kings}.downcase.en.titlecase.
			should == %{Cabbages and Kings}
	end

	it "titlecases _Clouds of Witness_ correctly" do
		%{Clouds of Witness}.downcase.en.titlecase.
			should == %{Clouds of Witness}
	end

	it "titlecases _A Confederacy of Dunces_ correctly" do
		%{A Confederacy of Dunces}.downcase.en.titlecase.
			should == %{A Confederacy of Dunces}
	end

	it "titlecases _Consider Phlebas_ correctly" do
		%{Consider Phlebas}.downcase.en.titlecase.
			should == %{Consider Phlebas}
	end

	it "titlecases _Consider the Lilies_ correctly" do
		%{Consider the Lilies}.downcase.en.titlecase.
			should == %{Consider the Lilies}
	end

	it "titlecases _Cover Her Face_ correctly" do
		%{Cover Her Face}.downcase.en.titlecase.
			should == %{Cover Her Face}
	end

	it "titlecases _The Cricket on the Hearth_ correctly" do
		%{The Cricket on the Hearth}.downcase.en.titlecase.
			should == %{The Cricket on the Hearth}
	end

	it "titlecases _The Curious Incident of the Dog in the Night-Time_ correctly" do
		%{The Curious Incident of the Dog in the Night-Time}.downcase.en.titlecase.
			should == %{The Curious Incident of the Dog in the Night-Time}
	end

	it "titlecases _The Daffodil Sky_ correctly" do
		%{The Daffodil Sky}.downcase.en.titlecase.
			should == %{The Daffodil Sky}
	end

	it "titlecases _A Darkling Plain_ correctly" do
		%{A Darkling Plain}.downcase.en.titlecase.
			should == %{A Darkling Plain}
	end

	it "titlecases _Death Be Not Proud_ correctly" do
		%{Death Be Not Proud}.downcase.en.titlecase.
			should == %{Death Be Not Proud}
	end

	it "titlecases _The Doors of Perception_ correctly" do
		%{The Doors of Perception}.downcase.en.titlecase.
			should == %{The Doors of Perception}
	end

	it "titlecases _Down to a Sunless Sea_ correctly" do
		%{Down to a Sunless Sea}.downcase.en.titlecase.
			should == %{Down to a Sunless Sea}
	end

	it "titlecases _Dying of the Light_ correctly" do
		%{Dying of the Light}.downcase.en.titlecase.
			should == %{Dying of the Light}
	end

	it "titlecases _East of Eden_ correctly" do
		%{East of Eden}.downcase.en.titlecase.
			should == %{East of Eden}
	end

	it "titlecases _Ego Dominus Tuus_ correctly" do
		%{Ego Dominus Tuus}.downcase.en.titlecase.
			should == %{Ego Dominus Tuus}
	end

	it "titlecases _Endless Night_ correctly" do
		%{Endless Night}.downcase.en.titlecase.
			should == %{Endless Night}
	end

	it "titlecases _Everything Is Illuminated_ correctly" do
		%{Everything Is Illuminated}.downcase.en.titlecase.
			should == %{Everything Is Illuminated}
	end

	it "titlecases _Eyeless in Gaza_ correctly" do
		%{Eyeless in Gaza}.downcase.en.titlecase.
			should == %{Eyeless in Gaza}
	end

	it "titlecases _Fair Stood the Wind for France_ correctly" do
		%{Fair Stood the Wind for France}.downcase.en.titlecase.
			should == %{Fair Stood the Wind for France}
	end

	it "titlecases _Fame Is the Spur_ correctly" do
		%{Fame Is the Spur}.downcase.en.titlecase.
			should == %{Fame Is the Spur}
	end

	it "titlecases _A Fanatic Heart_ correctly" do
		%{A Fanatic Heart}.downcase.en.titlecase.
			should == %{A Fanatic Heart}
	end

	it "titlecases _The Far-Distant Oxus_ correctly" do
		%{The Far-Distant Oxus}.downcase.en.titlecase.
			should == %{The Far-Distant Oxus}
	end

	it "titlecases _Far from the Madding Crowd_ correctly" do
		%{Far from the Madding Crowd}.downcase.en.titlecase.
			should == %{Far from the Madding Crowd}
	end

	it "titlecases _Fear and Trembling_ correctly" do
		%{Fear and Trembling}.downcase.en.titlecase.
			should == %{Fear and Trembling}
	end

	it "titlecases _For a Breath I Tarry_ correctly" do
		%{For a Breath I Tarry}.downcase.en.titlecase.
			should == %{For a Breath I Tarry}
	end

	it "titlecases _For Whom the Bell Tolls_ correctly" do
		%{For Whom the Bell Tolls}.downcase.en.titlecase.
			should == %{For Whom the Bell Tolls}
	end

	it "titlecases _A Glass of Blessings_ correctly" do
		%{A Glass of Blessings}.downcase.en.titlecase.
			should == %{A Glass of Blessings}
	end

	it "titlecases _The Glory and the Dream_ correctly" do
		%{The Glory and the Dream}.downcase.en.titlecase.
			should == %{The Glory and the Dream}
	end

	it "titlecases _The Golden Apples of the Sun_ correctly" do
		%{The Golden Apples of the Sun}.downcase.en.titlecase.
			should == %{The Golden Apples of the Sun}
	end

	it "titlecases _The Golden Bowl_ correctly" do
		%{The Golden Bowl}.downcase.en.titlecase.
			should == %{The Golden Bowl}
	end

	it "titlecases _Gone with the Wind_ correctly" do
		%{Gone with the Wind}.downcase.en.titlecase.
			should == %{Gone with the Wind}
	end

	it "titlecases _The Grapes of Wrath_ correctly" do
		%{The Grapes of Wrath}.downcase.en.titlecase.
			should == %{The Grapes of Wrath}
	end

	it "titlecases _Great Work of Time_ correctly" do
		%{Great Work of Time}.downcase.en.titlecase.
			should == %{Great Work of Time}
	end

	it "titlecases _The Green Bay Tree_ correctly" do
		%{The Green Bay Tree}.downcase.en.titlecase.
			should == %{The Green Bay Tree}
	end

	it "titlecases _A Handful of Dust_ correctly" do
		%{A Handful of Dust}.downcase.en.titlecase.
			should == %{A Handful of Dust}
	end

	it "titlecases _Have His Carcase_ correctly" do
		%{Have His Carcase}.downcase.en.titlecase.
			should == %{Have His Carcase}
	end

	it "titlecases _The Heart Is a Lonely Hunter_ correctly" do
		%{The Heart Is a Lonely Hunter}.downcase.en.titlecase.
			should == %{The Heart Is a Lonely Hunter}
	end

	it "titlecases _The Heart Is Deceitful Above All Things_ correctly" do
		%{The Heart Is Deceitful Above All Things}.downcase.en.titlecase.
			should == %{The Heart Is Deceitful Above All Things}
	end

	it "titlecases _His Dark Materials_ correctly" do
		%{His Dark Materials}.downcase.en.titlecase.
			should == %{His Dark Materials}
	end

	it "titlecases _The House of Mirth_ correctly" do
		%{The House of Mirth}.downcase.en.titlecase.
			should == %{The House of Mirth}
	end

	it "titlecases _How Sleep the Brave_ correctly" do
		%{How Sleep the Brave}.downcase.en.titlecase.
			should == %{How Sleep the Brave}
	end

	it "titlecases _If I Forget Thee Jerusalem_ correctly" do
		%{If I Forget Thee Jerusalem}.downcase.en.titlecase.
			should == %{If I Forget Thee Jerusalem}
	end

	it "titlecases _If Not Now, When?_ correctly" do
		%{If Not Now, When?}.downcase.en.titlecase.
			should == %{If Not Now, When?}
	end

	it "titlecases _In Death Ground_ correctly" do
		%{In Death Ground}.downcase.en.titlecase.
			should == %{In Death Ground}
	end

	it "titlecases _In Dubious Battle_ correctly" do
		%{In Dubious Battle}.downcase.en.titlecase.
			should == %{In Dubious Battle}
	end

	it "titlecases _I Know Why the Caged Bird Sings_ correctly" do
		%{I Know Why the Caged Bird Sings}.downcase.en.titlecase.
			should == %{I Know Why the Caged Bird Sings}
	end

	it "titlecases _In a Dry Season_ correctly" do
		%{In a Dry Season}.downcase.en.titlecase.
			should == %{In a Dry Season}
	end

	it "titlecases _An Instant in the Wind_ correctly" do
		%{An Instant in the Wind}.downcase.en.titlecase.
			should == %{An Instant in the Wind}
	end

	it "titlecases _I Sing the Body Electric_ correctly" do
		%{I Sing the Body Electric}.downcase.en.titlecase.
			should == %{I Sing the Body Electric}
	end

	it "titlecases _I Will Fear No Evil_ correctly" do
		%{I Will Fear No Evil}.downcase.en.titlecase.
			should == %{I Will Fear No Evil}
	end

	it "titlecases _O Jerusalem!_ correctly" do
		%{O Jerusalem!}.downcase.en.titlecase.
			should == %{O Jerusalem!}
	end

	it "titlecases _Jesting Pilate_ correctly" do
		%{Jesting Pilate}.downcase.en.titlecase.
			should == %{Jesting Pilate}
	end

	it "titlecases _The Last Temptation_ correctly" do
		%{The Last Temptation}.downcase.en.titlecase.
			should == %{The Last Temptation}
	end

	it "titlecases _The Lathe of Heaven_ correctly" do
		%{The Lathe of Heaven}.downcase.en.titlecase.
			should == %{The Lathe of Heaven}
	end

	it "titlecases _Let Us Now Praise Famous Men_ correctly" do
		%{Let Us Now Praise Famous Men}.downcase.en.titlecase.
			should == %{Let Us Now Praise Famous Men}
	end

	it "titlecases _Lilies of the Field_ correctly" do
		%{Lilies of the Field}.downcase.en.titlecase.
			should == %{Lilies of the Field}
	end

	it "titlecases _This Lime Tree Bower_ correctly" do
		%{This Lime Tree Bower}.downcase.en.titlecase.
			should == %{This Lime Tree Bower}
	end

	it "titlecases _The Line of Beauty_ correctly" do
		%{The Line of Beauty}.downcase.en.titlecase.
			should == %{The Line of Beauty}
	end

	it "titlecases _The Little Foxes_ correctly" do
		%{The Little Foxes}.downcase.en.titlecase.
			should == %{The Little Foxes}
	end

	it "titlecases _Little Hands Clapping_ correctly" do
		%{Little Hands Clapping}.downcase.en.titlecase.
			should == %{Little Hands Clapping}
	end

	it "titlecases _Look Homeward, Angel_ correctly" do
		%{Look Homeward, Angel}.downcase.en.titlecase.
			should == %{Look Homeward, Angel}
	end

	it "titlecases _Look to Windward_ correctly" do
		%{Look to Windward}.downcase.en.titlecase.
			should == %{Look to Windward}
	end

	it "titlecases _Many Waters_ correctly" do
		%{Many Waters}.downcase.en.titlecase.
			should == %{Many Waters}
	end

	it "titlecases _A Many-Splendoured Thing_ correctly" do
		%{A Many-Splendoured Thing}.downcase.en.titlecase.
			should == %{A Many-Splendoured Thing}
	end

	it "titlecases _The Mermaids Singing_ correctly" do
		%{The Mermaids Singing}.downcase.en.titlecase.
			should == %{The Mermaids Singing}
	end

	it "titlecases _The Mirror Crack'd from Side to Side_ correctly" do
		%{The Mirror Crack'd from Side to Side}.downcase.en.titlecase.
			should == %{The Mirror Crack'd from Side to Side}
	end

	it "titlecases _Moab Is My Washpot_ correctly" do
		%{Moab Is My Washpot}.downcase.en.titlecase.
			should == %{Moab Is My Washpot}
	end

	it "titlecases _The Monkey's Raincoat_ correctly" do
		%{The Monkey's Raincoat}.downcase.en.titlecase.
			should == %{The Monkey's Raincoat}
	end

	it "titlecases _A Monstrous Regiment of Women_ correctly" do
		%{A Monstrous Regiment of Women}.downcase.en.titlecase.
			should == %{A Monstrous Regiment of Women}
	end

	it "titlecases _The Moon by Night_ correctly" do
		%{The Moon by Night}.downcase.en.titlecase.
			should == %{The Moon by Night}
	end

	it "titlecases _Mother Night_ correctly" do
		%{Mother Night}.downcase.en.titlecase.
			should == %{Mother Night}
	end

	it "titlecases _The Moving Finger_ correctly" do
		%{The Moving Finger}.downcase.en.titlecase.
			should == %{The Moving Finger}
	end

	it "titlecases _Mr Standfast_ correctly" do
		%{Mr Standfast}.downcase.en.titlecase.
			should == %{Mr Standfast}
	end

	it "titlecases _Nectar in a Sieve_ correctly" do
		%{Nectar in a Sieve}.downcase.en.titlecase.
			should == %{Nectar in a Sieve}
	end

	it "titlecases _No Country for Old Men_ correctly" do
		%{No Country for Old Men}.downcase.en.titlecase.
			should == %{No Country for Old Men}
	end

	it "titlecases _No Highway_ correctly" do
		%{No Highway}.downcase.en.titlecase.
			should == %{No Highway}
	end

	it "titlecases _Noli Me Tangere_ correctly" do
		%{Noli Me Tangere}.downcase.en.titlecase.
			should == %{Noli Me Tangere}
	end

	it "titlecases _No Longer at Ease_ correctly" do
		%{No Longer at Ease}.downcase.en.titlecase.
			should == %{No Longer at Ease}
	end

	it "titlecases _Now Sleeps the Crimson Petal_ correctly" do
		%{Now Sleeps the Crimson Petal}.downcase.en.titlecase.
			should == %{Now Sleeps the Crimson Petal}
	end

	it "titlecases _Number the Stars_ correctly" do
		%{Number the Stars}.downcase.en.titlecase.
			should == %{Number the Stars}
	end

	it "titlecases _Of Human Bondage_ correctly" do
		%{Of Human Bondage}.downcase.en.titlecase.
			should == %{Of Human Bondage}
	end

	it "titlecases _Of Mice and Men_ correctly" do
		%{Of Mice and Men}.downcase.en.titlecase.
			should == %{Of Mice and Men}
	end

	it "titlecases _The Other Side of Silence_ correctly" do
		%{The Other Side of Silence}.downcase.en.titlecase.
			should == %{The Other Side of Silence}
	end

	it "titlecases _The Painted Veil_ correctly" do
		%{The Painted Veil}.downcase.en.titlecase.
			should == %{The Painted Veil}
	end

	it "titlecases _The Parliament of Man_ correctly" do
		%{The Parliament of Man}.downcase.en.titlecase.
			should == %{The Parliament of Man}
	end

	it "titlecases _Paths of Glory_ correctly" do
		%{Paths of Glory}.downcase.en.titlecase.
			should == %{Paths of Glory}
	end

	it "titlecases _A Passage to India_ correctly" do
		%{A Passage to India}.downcase.en.titlecase.
			should == %{A Passage to India}
	end

	it "titlecases _O Pioneers!_ correctly" do
		%{O Pioneers!}.downcase.en.titlecase.
			should == %{O Pioneers!}
	end

	it "titlecases _Postern of Fate_ correctly" do
		%{Postern of Fate}.downcase.en.titlecase.
			should == %{Postern of Fate}
	end

	it "titlecases _Precious Bane_ correctly" do
		%{Precious Bane}.downcase.en.titlecase.
			should == %{Precious Bane}
	end

	it "titlecases _The Proper Study_ correctly" do
		%{The Proper Study}.downcase.en.titlecase.
			should == %{The Proper Study}
	end

	it "titlecases _Quo Vadis_ correctly" do
		%{Quo Vadis}.downcase.en.titlecase.
			should == %{Quo Vadis}
	end

	it "titlecases _Recalled to Life_ correctly" do
		%{Recalled to Life}.downcase.en.titlecase.
			should == %{Recalled to Life}
	end

	it "titlecases _Recalled to Life_ correctly" do
		%{Recalled to Life}.downcase.en.titlecase.
			should == %{Recalled to Life}
	end

	it "titlecases _Ring of Bright Water_ correctly" do
		%{Ring of Bright Water}.downcase.en.titlecase.
			should == %{Ring of Bright Water}
	end

	it "titlecases _The Road Less Traveled_ correctly" do
		%{The Road Less Traveled}.downcase.en.titlecase.
			should == %{The Road Less Traveled}
	end

	it "titlecases _Shall Not Perish_ correctly" do
		%{Shall Not Perish}.downcase.en.titlecase.
			should == %{Shall Not Perish}
	end

	it "titlecases _The Skull Beneath the Skin_ correctly" do
		%{The Skull Beneath the Skin}.downcase.en.titlecase.
			should == %{The Skull Beneath the Skin}
	end

	it "titlecases _The Soldier's Art_ correctly" do
		%{The Soldier's Art}.downcase.en.titlecase.
			should == %{The Soldier's Art}
	end

	it "titlecases _Some Buried Caesar_ correctly" do
		%{Some Buried Caesar}.downcase.en.titlecase.
			should == %{Some Buried Caesar}
	end

	it "titlecases _Specimen Days_ correctly" do
		%{Specimen Days}.downcase.en.titlecase.
			should == %{Specimen Days}
	end

	it "titlecases _The Stars' Tennis Balls_ correctly" do
		%{The Stars' Tennis Balls}.downcase.en.titlecase.
			should == %{The Stars' Tennis Balls}
	end

	it "titlecases _Stranger in a Strange Land_ correctly" do
		%{Stranger in a Strange Land}.downcase.en.titlecase.
			should == %{Stranger in a Strange Land}
	end

	it "titlecases _Such, Such Were the Joys_ correctly" do
		%{Such, Such Were the Joys}.downcase.en.titlecase.
			should == %{Such, Such Were the Joys}
	end

	it "titlecases _The Sun Also Rises_ correctly" do
		%{The Sun Also Rises}.downcase.en.titlecase.
			should == %{The Sun Also Rises}
	end

	it "titlecases _Surprised by Joy_ correctly" do
		%{Surprised by Joy}.downcase.en.titlecase.
			should == %{Surprised by Joy}
	end

	it "titlecases _A Swiftly Tilting Planet_ correctly" do
		%{A Swiftly Tilting Planet}.downcase.en.titlecase.
			should == %{A Swiftly Tilting Planet}
	end

	it "titlecases _Tender Is the Night_ correctly" do
		%{Tender Is the Night}.downcase.en.titlecase.
			should == %{Tender Is the Night}
	end

	it "titlecases _Terrible Swift Sword_ correctly" do
		%{Terrible Swift Sword}.downcase.en.titlecase.
			should == %{Terrible Swift Sword}
	end

	it "titlecases _That Good Night_ correctly" do
		%{That Good Night}.downcase.en.titlecase.
			should == %{That Good Night}
	end

	it "titlecases _Things Fall Apart_ correctly" do
		%{Things Fall Apart}.downcase.en.titlecase.
			should == %{Things Fall Apart}
	end

	it "titlecases _This Side of Paradise_ correctly" do
		%{This Side of Paradise}.downcase.en.titlecase.
			should == %{This Side of Paradise}
	end

	it "titlecases _The Torment of Others_ correctly" do
		%{The Torment of Others}.downcase.en.titlecase.
			should == %{The Torment of Others}
	end

	it "titlecases _Those Barren Leaves_ correctly" do
		%{Those Barren Leaves}.downcase.en.titlecase.
			should == %{Those Barren Leaves}
	end

	it "titlecases _Thrones, Dominations_ correctly" do
		%{Thrones, Dominations}.downcase.en.titlecase.
			should == %{Thrones, Dominations}
	end

	it "titlecases _Tiger! Tiger!_ correctly" do
		%{Tiger! Tiger!}.downcase.en.titlecase.
			should == %{Tiger! Tiger!}
	end

	it "titlecases _A Time of Gifts_ correctly" do
		%{A Time of Gifts}.downcase.en.titlecase.
			should == %{A Time of Gifts}
	end

	it "titlecases _Time of Our Darkness_ correctly" do
		%{Time of Our Darkness}.downcase.en.titlecase.
			should == %{Time of Our Darkness}
	end

	it "titlecases _Time to Murder and Create_ correctly" do
		%{Time to Murder and Create}.downcase.en.titlecase.
			should == %{Time to Murder and Create}
	end

	it "titlecases _To a God Unknown_ correctly" do
		%{To a God Unknown}.downcase.en.titlecase.
			should == %{To a God Unknown}
	end

	it "titlecases _To Sail Beyond the Sunset_ correctly" do
		%{To Sail Beyond the Sunset}.downcase.en.titlecase.
			should == %{To Sail Beyond the Sunset}
	end

	it "titlecases _To Say Nothing of the Dog_ correctly" do
		%{To Say Nothing of the Dog}.downcase.en.titlecase.
			should == %{To Say Nothing of the Dog}
	end

	it "titlecases _Vanity Fair_ correctly" do
		%{Vanity Fair}.downcase.en.titlecase.
			should == %{Vanity Fair}
	end

	it "titlecases _Vile Bodies_ correctly" do
		%{Vile Bodies}.downcase.en.titlecase.
			should == %{Vile Bodies}
	end

	it "titlecases _The Violent Bear It Away_ correctly" do
		%{The Violent Bear It Away}.downcase.en.titlecase.
			should == %{The Violent Bear It Away}
	end

	it "titlecases _Waiting for the Barbarians_ correctly" do
		%{Waiting for the Barbarians}.downcase.en.titlecase.
			should == %{Waiting for the Barbarians}
	end

	it "titlecases _The Waste Land_ correctly" do
		%{The Waste Land}.downcase.en.titlecase.
			should == %{The Waste Land}
	end

	it "titlecases _The Way of All Flesh_ correctly" do
		%{The Way of All Flesh}.downcase.en.titlecase.
			should == %{The Way of All Flesh}
	end

	it "titlecases _The Way Through the Woods_ correctly" do
		%{The Way Through the Woods}.downcase.en.titlecase.
			should == %{The Way Through the Woods}
	end

	it "titlecases _The Wealth of Nations_ correctly" do
		%{The Wealth of Nations}.downcase.en.titlecase.
			should == %{The Wealth of Nations}
	end

	it "titlecases _What's Become of Waring_ correctly" do
		%{What's Become of Waring}.downcase.en.titlecase.
			should == %{What's Become of Waring}
	end

	it "titlecases _When the Green Woods Laugh_ correctly" do
		%{When the Green Woods Laugh}.downcase.en.titlecase.
			should == %{When the Green Woods Laugh}
	end

	it "titlecases _Where Angels Fear to Tread_ correctly" do
		%{Where Angels Fear to Tread}.downcase.en.titlecase.
			should == %{Where Angels Fear to Tread}
	end

	it "titlecases _The Wives of Bath_ correctly" do
		%{The Wives of Bath}.downcase.en.titlecase.
			should == %{The Wives of Bath}
	end

	it "titlecases _The World, the Flesh and the Devil_ correctly" do
		%{The World, the Flesh and the Devil}.downcase.en.titlecase.
			should == %{The World, the Flesh and the Devil}
	end

	it "titlecases _The Yellow Meads of Asphodel_ correctly" do
		%{The Yellow Meads of Asphodel}.downcase.en.titlecase.
			should == %{The Yellow Meads of Asphodel}
	end

end

