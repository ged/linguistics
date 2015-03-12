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
		expect( "motion is madness".en.to_camel_case ).to eq( 'motionIsMadness' )
	end

	it "CamelCases 'Special Verb Case' correctly" do
		expect( "Special Verb Case".en.to_camel_case ).to eq( 'SpecialVerbCase' )
	end

	it "un-CamelCases 'motionIsMadness' correctly" do
		expect( "motionIsMadness".en.un_camel_case ).to eq( 'motion is madness' )
	end

	it "un-CamelCases 'ASpecialVerbCase' correctly" do
		expect( "ASpecialVerbCase".en.un_camel_case ).to eq( 'a special verb case' )
	end

	it "titlecases _Absalom, Absalom!_ correctly" do
		expect( %{Absalom, Absalom!}.downcase.en.titlecase ).to eq( %{Absalom, Absalom!} )
	end

	it "titlecases _After Many a Summer Dies the Swan_ correctly" do
		expect(
			%{After Many a Summer Dies the Swan}.downcase.en.titlecase
		).to eq( %{After Many a Summer Dies the Swan} )
	end

	it "titlecases _Ah, Wilderness!_ correctly" do
		expect( %{Ah, Wilderness!}.downcase.en.titlecase ).to eq( %{Ah, Wilderness!} )
	end

	it "titlecases _Alien Corn_ correctly" do
		expect( %{Alien Corn}.downcase.en.titlecase ).to eq( %{Alien Corn} )
	end

	it "titlecases _The Alien Corn_ correctly" do
		expect( %{The Alien Corn}.downcase.en.titlecase ).to eq( %{The Alien Corn} )
	end

	it "titlecases _All Passion Spent_ correctly" do
		expect( %{All Passion Spent}.downcase.en.titlecase ).to eq( %{All Passion Spent} )
	end

	it "titlecases _All the King's Men_ correctly" do
		expect( %{All the King's Men}.downcase.en.titlecase ).to eq( %{All the King's Men} )
	end

	it "titlecases _Alone on a Wide, Wide Sea_ correctly" do
		expect(
			%{Alone on a Wide, Wide Sea}.downcase.en.titlecase
		).to eq( %{Alone on a Wide, Wide Sea} )
	end

	it "titlecases _An Acceptable Time_ correctly" do
		expect( %{An Acceptable Time}.downcase.en.titlecase ).to eq( %{An Acceptable Time} )
	end

	it "titlecases _Antic Hay_ correctly" do
		expect( %{Antic Hay}.downcase.en.titlecase ).to eq( %{Antic Hay} )
	end

	it "titlecases _An Evil Cradling_ correctly" do
		expect( %{An Evil Cradling}.downcase.en.titlecase ).to eq( %{An Evil Cradling} )
	end

	it "titlecases _Arms and the Man_ correctly" do
		expect( %{Arms and the Man}.downcase.en.titlecase ).to eq( %{Arms and the Man} )
	end

	it "titlecases _As I Lay Dying_ correctly" do
		expect( %{As I Lay Dying}.downcase.en.titlecase ).to eq( %{As I Lay Dying} )
	end

	it "titlecases _A Time to Kill_ correctly" do
		expect( %{A Time to Kill}.downcase.en.titlecase ).to eq( %{A Time to Kill} )
	end

	it "titlecases _Behold the Man_ correctly" do
		expect( %{Behold the Man}.downcase.en.titlecase ).to eq( %{Behold the Man} )
	end

	it "titlecases _Beneath the Bleeding_ correctly" do
		expect( %{Beneath the Bleeding}.downcase.en.titlecase ).to eq( %{Beneath the Bleeding} )
	end

	it "titlecases _Beyond the Mexique Bay_ correctly" do
		expect( %{Beyond the Mexique Bay}.downcase.en.titlecase ).to eq( %{Beyond the Mexique Bay} )
	end

	it "titlecases _Blithe Spirit_ correctly" do
		expect( %{Blithe Spirit}.downcase.en.titlecase ).to eq( %{Blithe Spirit} )
	end

	it "titlecases _Blood's a Rover_ correctly" do
		expect( %{Blood's a Rover}.downcase.en.titlecase ).to eq( %{Blood's a Rover} )
	end

	it "titlecases _Boats Against the Current_ correctly" do
		expect(
			%{Boats Against the Current}.downcase.en.titlecase
		).to eq( %{Boats Against the Current} )
	end

	it "titlecases _Bonjour Tristesse_ correctly" do
		expect( %{Bonjour Tristesse}.downcase.en.titlecase ).to eq( %{Bonjour Tristesse} )
	end

	it "titlecases _Brandy of the Damned_ correctly" do
		expect( %{Brandy of the Damned}.downcase.en.titlecase ).to eq( %{Brandy of the Damned} )
	end

	it "titlecases _Bury My Heart at Wounded Knee_ correctly" do
		expect(
			%{Bury My Heart at Wounded Knee}.downcase.en.titlecase
		).to eq( %{Bury My Heart at Wounded Knee} )
	end

	it "titlecases _Cabbages and Kings_ correctly" do
		expect( %{Cabbages and Kings}.downcase.en.titlecase ).to eq( %{Cabbages and Kings} )
	end

	it "titlecases _Clouds of Witness_ correctly" do
		expect( %{Clouds of Witness}.downcase.en.titlecase ).to eq( %{Clouds of Witness} )
	end

	it "titlecases _A Confederacy of Dunces_ correctly" do
		expect(
			%{A Confederacy of Dunces}.downcase.en.titlecase
		).to eq( %{A Confederacy of Dunces} )
	end

	it "titlecases _Consider Phlebas_ correctly" do
		expect( %{Consider Phlebas}.downcase.en.titlecase ).to eq( %{Consider Phlebas} )
	end

	it "titlecases _Consider the Lilies_ correctly" do
		expect( %{Consider the Lilies}.downcase.en.titlecase ).to eq( %{Consider the Lilies} )
	end

	it "titlecases _Cover Her Face_ correctly" do
		expect( %{Cover Her Face}.downcase.en.titlecase ).to eq( %{Cover Her Face} )
	end

	it "titlecases _The Cricket on the Hearth_ correctly" do
		expect(
			%{The Cricket on the Hearth}.downcase.en.titlecase
		).to eq( %{The Cricket on the Hearth} )
	end

	it "titlecases _The Curious Incident of the Dog in the Night-Time_ correctly" do
		expect(
			%{The Curious Incident of the Dog in the Night-Time}.downcase.en.titlecase
		).to eq( %{The Curious Incident of the Dog in the Night-Time} )
	end

	it "titlecases _The Daffodil Sky_ correctly" do
		expect( %{The Daffodil Sky}.downcase.en.titlecase ).to eq( %{The Daffodil Sky} )
	end

	it "titlecases _A Darkling Plain_ correctly" do
		expect( %{A Darkling Plain}.downcase.en.titlecase ).to eq( %{A Darkling Plain} )
	end

	it "titlecases _Death Be Not Proud_ correctly" do
		expect( %{Death Be Not Proud}.downcase.en.titlecase ).to eq( %{Death Be Not Proud} )
	end

	it "titlecases _The Doors of Perception_ correctly" do
		expect( %{The Doors of Perception}.downcase.en.titlecase ).to eq( %{The Doors of Perception} )
	end

	it "titlecases _Down to a Sunless Sea_ correctly" do
		expect( %{Down to a Sunless Sea}.downcase.en.titlecase ).to eq( %{Down to a Sunless Sea} )
	end

	it "titlecases _Dying of the Light_ correctly" do
		expect( %{Dying of the Light}.downcase.en.titlecase ).to eq( %{Dying of the Light} )
	end

	it "titlecases _East of Eden_ correctly" do
		expect( %{East of Eden}.downcase.en.titlecase ).to eq( %{East of Eden} )
	end

	it "titlecases _Ego Dominus Tuus_ correctly" do
		expect( %{Ego Dominus Tuus}.downcase.en.titlecase ).to eq( %{Ego Dominus Tuus} )
	end

	it "titlecases _Endless Night_ correctly" do
		expect( %{Endless Night}.downcase.en.titlecase ).to eq( %{Endless Night} )
	end

	it "titlecases _Everything Is Illuminated_ correctly" do
		expect(
			%{Everything Is Illuminated}.downcase.en.titlecase
		).to eq( %{Everything Is Illuminated} )
	end

	it "titlecases _Eyeless in Gaza_ correctly" do
		expect( %{Eyeless in Gaza}.downcase.en.titlecase ).to eq( %{Eyeless in Gaza} )
	end

	it "titlecases _Fair Stood the Wind for France_ correctly" do
		expect(
			%{Fair Stood the Wind for France}.downcase.en.titlecase
		).to eq( %{Fair Stood the Wind for France} )
	end

	it "titlecases _Fame Is the Spur_ correctly" do
		expect( %{Fame Is the Spur}.downcase.en.titlecase ).to eq( %{Fame Is the Spur} )
	end

	it "titlecases _A Fanatic Heart_ correctly" do
		expect( %{A Fanatic Heart}.downcase.en.titlecase ).to eq( %{A Fanatic Heart} )
	end

	it "titlecases _The Far-Distant Oxus_ correctly" do
		expect( %{The Far-Distant Oxus}.downcase.en.titlecase ).to eq( %{The Far-Distant Oxus} )
	end

	it "titlecases _Far from the Madding Crowd_ correctly" do
		expect(
			%{Far from the Madding Crowd}.downcase.en.titlecase
		).to eq( %{Far from the Madding Crowd} )
	end

	it "titlecases _Fear and Trembling_ correctly" do
		expect( %{Fear and Trembling}.downcase.en.titlecase ).to eq( %{Fear and Trembling} )
	end

	it "titlecases _For a Breath I Tarry_ correctly" do
		expect( %{For a Breath I Tarry}.downcase.en.titlecase ).to eq( %{For a Breath I Tarry} )
	end

	it "titlecases _For Whom the Bell Tolls_ correctly" do
		expect( %{For Whom the Bell Tolls}.downcase.en.titlecase ).to eq( %{For Whom the Bell Tolls} )
	end

	it "titlecases _A Glass of Blessings_ correctly" do
		expect( %{A Glass of Blessings}.downcase.en.titlecase ).to eq( %{A Glass of Blessings} )
	end

	it "titlecases _The Glory and the Dream_ correctly" do
		expect( %{The Glory and the Dream}.downcase.en.titlecase ).to eq( %{The Glory and the Dream} )
	end

	it "titlecases _The Golden Apples of the Sun_ correctly" do
		expect(
			%{The Golden Apples of the Sun}.downcase.en.titlecase
		).to eq( %{The Golden Apples of the Sun} )
	end

	it "titlecases _The Golden Bowl_ correctly" do
		expect( %{The Golden Bowl}.downcase.en.titlecase ).to eq( %{The Golden Bowl} )
	end

	it "titlecases _Gone with the Wind_ correctly" do
		expect( %{Gone with the Wind}.downcase.en.titlecase ).to eq( %{Gone with the Wind} )
	end

	it "titlecases _The Grapes of Wrath_ correctly" do
		expect( %{The Grapes of Wrath}.downcase.en.titlecase ).to eq( %{The Grapes of Wrath} )
	end

	it "titlecases _Great Work of Time_ correctly" do
		expect( %{Great Work of Time}.downcase.en.titlecase ).to eq( %{Great Work of Time} )
	end

	it "titlecases _The Green Bay Tree_ correctly" do
		expect( %{The Green Bay Tree}.downcase.en.titlecase ).to eq( %{The Green Bay Tree} )
	end

	it "titlecases _A Handful of Dust_ correctly" do
		expect( %{A Handful of Dust}.downcase.en.titlecase ).to eq( %{A Handful of Dust} )
	end

	it "titlecases _Have His Carcase_ correctly" do
		expect( %{Have His Carcase}.downcase.en.titlecase ).to eq( %{Have His Carcase} )
	end

	it "titlecases _The Heart Is a Lonely Hunter_ correctly" do
		expect(
			%{The Heart Is a Lonely Hunter}.downcase.en.titlecase
		).to eq( %{The Heart Is a Lonely Hunter} )
	end

	it "titlecases _The Heart Is Deceitful Above All Things_ correctly" do
		expect(
			%{The Heart Is Deceitful Above All Things}.downcase.en.titlecase
		).to eq( %{The Heart Is Deceitful Above All Things} )
	end

	it "titlecases _His Dark Materials_ correctly" do
		expect( %{His Dark Materials}.downcase.en.titlecase ).to eq( %{His Dark Materials} )
	end

	it "titlecases _The House of Mirth_ correctly" do
		expect( %{The House of Mirth}.downcase.en.titlecase ).to eq( %{The House of Mirth} )
	end

	it "titlecases _How Sleep the Brave_ correctly" do
		expect( %{How Sleep the Brave}.downcase.en.titlecase ).to eq( %{How Sleep the Brave} )
	end

	it "titlecases _If I Forget Thee Jerusalem_ correctly" do
		expect(
			%{If I Forget Thee Jerusalem}.downcase.en.titlecase
		).to eq( %{If I Forget Thee Jerusalem} )
	end

	it "titlecases _If Not Now, When?_ correctly" do
		expect( %{If Not Now, When?}.downcase.en.titlecase ).to eq( %{If Not Now, When?} )
	end

	it "titlecases _In Death Ground_ correctly" do
		expect( %{In Death Ground}.downcase.en.titlecase ).to eq( %{In Death Ground} )
	end

	it "titlecases _In Dubious Battle_ correctly" do
		expect( %{In Dubious Battle}.downcase.en.titlecase ).to eq( %{In Dubious Battle} )
	end

	it "titlecases _I Know Why the Caged Bird Sings_ correctly" do
		expect(
			%{I Know Why the Caged Bird Sings}.downcase.en.titlecase
		).to eq( %{I Know Why the Caged Bird Sings} )
	end

	it "titlecases _In a Dry Season_ correctly" do
		expect( %{In a Dry Season}.downcase.en.titlecase ).to eq( %{In a Dry Season} )
	end

	it "titlecases _An Instant in the Wind_ correctly" do
		expect( %{An Instant in the Wind}.downcase.en.titlecase ).to eq( %{An Instant in the Wind} )
	end

	it "titlecases _I Sing the Body Electric_ correctly" do
		expect(
			%{I Sing the Body Electric}.downcase.en.titlecase
		).to eq( %{I Sing the Body Electric} )
	end

	it "titlecases _I Will Fear No Evil_ correctly" do
		expect( %{I Will Fear No Evil}.downcase.en.titlecase ).to eq( %{I Will Fear No Evil} )
	end

	it "titlecases _O Jerusalem!_ correctly" do
		expect( %{O Jerusalem!}.downcase.en.titlecase ).to eq( %{O Jerusalem!} )
	end

	it "titlecases _Jesting Pilate_ correctly" do
		expect( %{Jesting Pilate}.downcase.en.titlecase ).to eq( %{Jesting Pilate} )
	end

	it "titlecases _The Last Temptation_ correctly" do
		expect( %{The Last Temptation}.downcase.en.titlecase ).to eq( %{The Last Temptation} )
	end

	it "titlecases _The Lathe of Heaven_ correctly" do
		expect( %{The Lathe of Heaven}.downcase.en.titlecase ).to eq( %{The Lathe of Heaven} )
	end

	it "titlecases _Let Us Now Praise Famous Men_ correctly" do
		expect(
			%{Let Us Now Praise Famous Men}.downcase.en.titlecase
		).to eq( %{Let Us Now Praise Famous Men} )
	end

	it "titlecases _Lilies of the Field_ correctly" do
		expect( %{Lilies of the Field}.downcase.en.titlecase ).to eq( %{Lilies of the Field} )
	end

	it "titlecases _This Lime Tree Bower_ correctly" do
		expect( %{This Lime Tree Bower}.downcase.en.titlecase ).to eq( %{This Lime Tree Bower} )
	end

	it "titlecases _The Line of Beauty_ correctly" do
		expect( %{The Line of Beauty}.downcase.en.titlecase ).to eq( %{The Line of Beauty} )
	end

	it "titlecases _The Little Foxes_ correctly" do
		expect( %{The Little Foxes}.downcase.en.titlecase ).to eq( %{The Little Foxes} )
	end

	it "titlecases _Little Hands Clapping_ correctly" do
		expect( %{Little Hands Clapping}.downcase.en.titlecase ).to eq( %{Little Hands Clapping} )
	end

	it "titlecases _Look Homeward, Angel_ correctly" do
		expect( %{Look Homeward, Angel}.downcase.en.titlecase ).to eq( %{Look Homeward, Angel} )
	end

	it "titlecases _Look to Windward_ correctly" do
		expect( %{Look to Windward}.downcase.en.titlecase ).to eq( %{Look to Windward} )
	end

	it "titlecases _Many Waters_ correctly" do
		expect( %{Many Waters}.downcase.en.titlecase ).to eq( %{Many Waters} )
	end

	it "titlecases _A Many-Splendoured Thing_ correctly" do
		expect(
			%{A Many-Splendoured Thing}.downcase.en.titlecase
		).to eq( %{A Many-Splendoured Thing} )
	end

	it "titlecases _The Mermaids Singing_ correctly" do
		expect( %{The Mermaids Singing}.downcase.en.titlecase ).to eq( %{The Mermaids Singing} )
	end

	it "titlecases _The Mirror Crack'd from Side to Side_ correctly" do
		expect(
			%{The Mirror Crack'd from Side to Side}.downcase.en.titlecase
		).to eq( %{The Mirror Crack'd from Side to Side} )
	end

	it "titlecases _Moab Is My Washpot_ correctly" do
		expect( %{Moab Is My Washpot}.downcase.en.titlecase ).to eq( %{Moab Is My Washpot} )
	end

	it "titlecases _The Monkey's Raincoat_ correctly" do
		expect( %{The Monkey's Raincoat}.downcase.en.titlecase ).to eq( %{The Monkey's Raincoat} )
	end

	it "titlecases _A Monstrous Regiment of Women_ correctly" do
		expect(
			%{A Monstrous Regiment of Women}.downcase.en.titlecase
		).to eq( %{A Monstrous Regiment of Women} )
	end

	it "titlecases _The Moon by Night_ correctly" do
		expect( %{The Moon by Night}.downcase.en.titlecase ).to eq( %{The Moon by Night} )
	end

	it "titlecases _Mother Night_ correctly" do
		expect( %{Mother Night}.downcase.en.titlecase ).to eq( %{Mother Night} )
	end

	it "titlecases _The Moving Finger_ correctly" do
		expect( %{The Moving Finger}.downcase.en.titlecase ).to eq( %{The Moving Finger} )
	end

	it "titlecases _Mr Standfast_ correctly" do
		expect( %{Mr Standfast}.downcase.en.titlecase ).to eq( %{Mr Standfast} )
	end

	it "titlecases _Nectar in a Sieve_ correctly" do
		expect( %{Nectar in a Sieve}.downcase.en.titlecase ).to eq( %{Nectar in a Sieve} )
	end

	it "titlecases _No Country for Old Men_ correctly" do
		expect( %{No Country for Old Men}.downcase.en.titlecase ).to eq( %{No Country for Old Men} )
	end

	it "titlecases _No Highway_ correctly" do
		expect( %{No Highway}.downcase.en.titlecase ).to eq( %{No Highway} )
	end

	it "titlecases _Noli Me Tangere_ correctly" do
		expect( %{Noli Me Tangere}.downcase.en.titlecase ).to eq( %{Noli Me Tangere} )
	end

	it "titlecases _No Longer at Ease_ correctly" do
		expect( %{No Longer at Ease}.downcase.en.titlecase ).to eq( %{No Longer at Ease} )
	end

	it "titlecases _Now Sleeps the Crimson Petal_ correctly" do
		expect(
			%{Now Sleeps the Crimson Petal}.downcase.en.titlecase
		).to eq( %{Now Sleeps the Crimson Petal} )
	end

	it "titlecases _Number the Stars_ correctly" do
		expect( %{Number the Stars}.downcase.en.titlecase ).to eq( %{Number the Stars} )
	end

	it "titlecases _Of Human Bondage_ correctly" do
		expect( %{Of Human Bondage}.downcase.en.titlecase ).to eq( %{Of Human Bondage} )
	end

	it "titlecases _Of Mice and Men_ correctly" do
		expect( %{Of Mice and Men}.downcase.en.titlecase ).to eq( %{Of Mice and Men} )
	end

	it "titlecases _The Other Side of Silence_ correctly" do
		expect(
			%{The Other Side of Silence}.downcase.en.titlecase
		).to eq( %{The Other Side of Silence} )
	end

	it "titlecases _The Painted Veil_ correctly" do
		expect( %{The Painted Veil}.downcase.en.titlecase ).to eq( %{The Painted Veil} )
	end

	it "titlecases _The Parliament of Man_ correctly" do
		expect( %{The Parliament of Man}.downcase.en.titlecase ).to eq( %{The Parliament of Man} )
	end

	it "titlecases _Paths of Glory_ correctly" do
		expect( %{Paths of Glory}.downcase.en.titlecase ).to eq( %{Paths of Glory} )
	end

	it "titlecases _A Passage to India_ correctly" do
		expect( %{A Passage to India}.downcase.en.titlecase ).to eq( %{A Passage to India} )
	end

	it "titlecases _O Pioneers!_ correctly" do
		expect( %{O Pioneers!}.downcase.en.titlecase ).to eq( %{O Pioneers!} )
	end

	it "titlecases _Postern of Fate_ correctly" do
		expect( %{Postern of Fate}.downcase.en.titlecase ).to eq( %{Postern of Fate} )
	end

	it "titlecases _Precious Bane_ correctly" do
		expect( %{Precious Bane}.downcase.en.titlecase ).to eq( %{Precious Bane} )
	end

	it "titlecases _The Proper Study_ correctly" do
		expect( %{The Proper Study}.downcase.en.titlecase ).to eq( %{The Proper Study} )
	end

	it "titlecases _Quo Vadis_ correctly" do
		expect( %{Quo Vadis}.downcase.en.titlecase ).to eq( %{Quo Vadis} )
	end

	it "titlecases _Recalled to Life_ correctly" do
		expect( %{Recalled to Life}.downcase.en.titlecase ).to eq( %{Recalled to Life} )
	end

	it "titlecases _Recalled to Life_ correctly" do
		expect( %{Recalled to Life}.downcase.en.titlecase ).to eq( %{Recalled to Life} )
	end

	it "titlecases _Ring of Bright Water_ correctly" do
		expect( %{Ring of Bright Water}.downcase.en.titlecase ).to eq( %{Ring of Bright Water} )
	end

	it "titlecases _The Road Less Traveled_ correctly" do
		expect( %{The Road Less Traveled}.downcase.en.titlecase ).to eq( %{The Road Less Traveled} )
	end

	it "titlecases _Shall Not Perish_ correctly" do
		expect( %{Shall Not Perish}.downcase.en.titlecase ).to eq( %{Shall Not Perish} )
	end

	it "titlecases _The Skull Beneath the Skin_ correctly" do
		expect(
			%{The Skull Beneath the Skin}.downcase.en.titlecase
		).to eq( %{The Skull Beneath the Skin} )
	end

	it "titlecases _The Soldier's Art_ correctly" do
		expect( %{The Soldier's Art}.downcase.en.titlecase ).to eq( %{The Soldier's Art} )
	end

	it "titlecases _Some Buried Caesar_ correctly" do
		expect( %{Some Buried Caesar}.downcase.en.titlecase ).to eq( %{Some Buried Caesar} )
	end

	it "titlecases _Specimen Days_ correctly" do
		expect( %{Specimen Days}.downcase.en.titlecase ).to eq( %{Specimen Days} )
	end

	it "titlecases _The Stars' Tennis Balls_ correctly" do
		expect(
			%{The Stars' Tennis Balls}.downcase.en.titlecase
		).to eq( %{The Stars' Tennis Balls} )
	end

	it "titlecases _Stranger in a Strange Land_ correctly" do
		expect(
			%{Stranger in a Strange Land}.downcase.en.titlecase
		).to eq( %{Stranger in a Strange Land} )
	end

	it "titlecases _Such, Such Were the Joys_ correctly" do
		expect(
			%{Such, Such Were the Joys}.downcase.en.titlecase
		).to eq( %{Such, Such Were the Joys} )
	end

	it "titlecases _The Sun Also Rises_ correctly" do
		expect( %{The Sun Also Rises}.downcase.en.titlecase ).to eq( %{The Sun Also Rises} )
	end

	it "titlecases _Surprised by Joy_ correctly" do
		expect( %{Surprised by Joy}.downcase.en.titlecase ).to eq( %{Surprised by Joy} )
	end

	it "titlecases _A Swiftly Tilting Planet_ correctly" do
		expect(
			%{A Swiftly Tilting Planet}.downcase.en.titlecase
		).to eq( %{A Swiftly Tilting Planet} )
	end

	it "titlecases _Tender Is the Night_ correctly" do
		expect( %{Tender Is the Night}.downcase.en.titlecase ).to eq( %{Tender Is the Night} )
	end

	it "titlecases _Terrible Swift Sword_ correctly" do
		expect( %{Terrible Swift Sword}.downcase.en.titlecase ).to eq( %{Terrible Swift Sword} )
	end

	it "titlecases _That Good Night_ correctly" do
		expect( %{That Good Night}.downcase.en.titlecase ).to eq( %{That Good Night} )
	end

	it "titlecases _Things Fall Apart_ correctly" do
		expect( %{Things Fall Apart}.downcase.en.titlecase ).to eq( %{Things Fall Apart} )
	end

	it "titlecases _This Side of Paradise_ correctly" do
		expect( %{This Side of Paradise}.downcase.en.titlecase ).to eq( %{This Side of Paradise} )
	end

	it "titlecases _The Torment of Others_ correctly" do
		expect( %{The Torment of Others}.downcase.en.titlecase ).to eq( %{The Torment of Others} )
	end

	it "titlecases _Those Barren Leaves_ correctly" do
		expect( %{Those Barren Leaves}.downcase.en.titlecase ).to eq( %{Those Barren Leaves} )
	end

	it "titlecases _Thrones, Dominations_ correctly" do
		expect( %{Thrones, Dominations}.downcase.en.titlecase ).to eq( %{Thrones, Dominations} )
	end

	it "titlecases _Tiger! Tiger!_ correctly" do
		expect( %{Tiger! Tiger!}.downcase.en.titlecase ).to eq( %{Tiger! Tiger!} )
	end

	it "titlecases _A Time of Gifts_ correctly" do
		expect( %{A Time of Gifts}.downcase.en.titlecase ).to eq( %{A Time of Gifts} )
	end

	it "titlecases _Time of Our Darkness_ correctly" do
		expect( %{Time of Our Darkness}.downcase.en.titlecase ).to eq( %{Time of Our Darkness} )
	end

	it "titlecases _Time to Murder and Create_ correctly" do
		expect(
			%{Time to Murder and Create}.downcase.en.titlecase
		).to eq( %{Time to Murder and Create} )
	end

	it "titlecases _To a God Unknown_ correctly" do
		expect( %{To a God Unknown}.downcase.en.titlecase ).to eq( %{To a God Unknown} )
	end

	it "titlecases _To Sail Beyond the Sunset_ correctly" do
		expect(
			%{To Sail Beyond the Sunset}.downcase.en.titlecase
		).to eq( %{To Sail Beyond the Sunset} )
	end

	it "titlecases _To Say Nothing of the Dog_ correctly" do
		expect(
			%{To Say Nothing of the Dog}.downcase.en.titlecase
		).to eq( %{To Say Nothing of the Dog} )
	end

	it "titlecases _Vanity Fair_ correctly" do
		expect( %{Vanity Fair}.downcase.en.titlecase ).to eq( %{Vanity Fair} )
	end

	it "titlecases _Vile Bodies_ correctly" do
		expect( %{Vile Bodies}.downcase.en.titlecase ).to eq( %{Vile Bodies} )
	end

	it "titlecases _The Violent Bear It Away_ correctly" do
		expect(
			%{The Violent Bear It Away}.downcase.en.titlecase
		).to eq( %{The Violent Bear It Away} )
	end

	it "titlecases _Waiting for the Barbarians_ correctly" do
		expect(
			%{Waiting for the Barbarians}.downcase.en.titlecase
		).to eq( %{Waiting for the Barbarians} )
	end

	it "titlecases _The Waste Land_ correctly" do
		expect( %{The Waste Land}.downcase.en.titlecase ).to eq( %{The Waste Land} )
	end

	it "titlecases _The Way of All Flesh_ correctly" do
		expect( %{The Way of All Flesh}.downcase.en.titlecase ).to eq( %{The Way of All Flesh} )
	end

	it "titlecases _The Way Through the Woods_ correctly" do
		expect(
			%{The Way Through the Woods}.downcase.en.titlecase
		).to eq( %{The Way Through the Woods} )
	end

	it "titlecases _The Wealth of Nations_ correctly" do
		expect(
			%{The Wealth of Nations}.downcase.en.titlecase
		).to eq( %{The Wealth of Nations} )
	end

	it "titlecases _What's Become of Waring_ correctly" do
		expect(
			%{What's Become of Waring}.downcase.en.titlecase
		).to eq( %{What's Become of Waring} )
	end

	it "titlecases _When the Green Woods Laugh_ correctly" do
		expect(
			%{When the Green Woods Laugh}.downcase.en.titlecase
		).to eq( %{When the Green Woods Laugh} )
	end

	it "titlecases _Where Angels Fear to Tread_ correctly" do
		expect(
			%{Where Angels Fear to Tread}.downcase.en.titlecase
		).to eq( %{Where Angels Fear to Tread} )
	end

	it "titlecases _The Wives of Bath_ correctly" do
		expect( %{The Wives of Bath}.downcase.en.titlecase ).to eq( %{The Wives of Bath} )
	end

	it "titlecases _The World, the Flesh and the Devil_ correctly" do
		expect(
			%{The World, the Flesh and the Devil}.downcase.en.titlecase
		).to eq( %{The World, the Flesh and the Devil} )
	end

	it "titlecases _The Yellow Meads of Asphodel_ correctly" do
		expect(
			%{The Yellow Meads of Asphodel}.downcase.en.titlecase
		).to eq( %{The Yellow Meads of Asphodel} )
	end

end

