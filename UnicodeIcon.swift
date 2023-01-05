//
//  UnicodeIcon.swift
//  MyHouse
//
//  Created by Yu Hong on 2017-01-23.
//  Copyright © 2017 Yu Hong. All rights reserved.
//

import Foundation

class UnicodeIcon {
    
    enum UnicodeIconKey : String {
        /*----- Mathmatics -----*/
        case Enclosed0, Enclosed1, Enclosed2, Enclosed3, Enclosed4, Enclosed5, Enclosed6, Enclosed7, Enclosed8, Enclosed9
        case SquareRoot, Addition, Substract, Divide, Multiple, Mod, Dot
        /*----- Faces -----*/
        case SadFace, HappyFace, ThinkingFace, GrinningFace, SmileHornFace
        case WinkingFace, AngryFace, CryingFace, FearfulFace, ScreamingFace
        case AstonishedFace, SleepingFace
        /*----- ButtonIcon -----*/
        case Delete, Enter, Ack, Close, Checked
        case Info, Info1
        case Setting, Setting1, HeavyBallotX
        case Search, Search1, Warning, Alarm, Alert, Uncertainty, HeavyExclamation
        case Recycle, RecycleWithCircle, Blocking, Reset
        case Eject
        case QuestionWhite
        case ArrowLeft, ArrowUp, ArrowRight, ArrowDown, ArrowUpAndDown, ArrowRight1, ArrowBack, ArrowTop
        case RightPointing
        case UpTriangle, DownTriangle
        case Checkedbox, Uncheckedbox
        case Help, StopPlay, StartPlay, PausePlay, RecordPlay
        case EnclosedNew
        /*----- Weather -----*/
        case Snow, Rain, Sun, Cloud, Snow1
        case CrescentMoon, MoonWithFace, FullMoon
        case SunWithFace, Rainbow, GlowingStar, ShootingStar
        case CloudWithRain, CloudWithSnow, SunWithCloud
        case WhiteSun, Lighting, Tornado
        case BlackStar, WhiteStar, SnowMan
        case Celsius, Fahrenheit
        /*----- Utilities -----*/
        case LockKey, Key, Lock, Unlock
        case Bell, Unbell
        case Bookmark, Book
        case Door
        case MediumShade
        case CopyRight, RegisteredSign
        case BlueBook, OpenBook, ClosedBook
        /*----- Home -----*/
        case House, HouseTree, Family, Couple, Friend, Friend1
        case PersonWithBall
        case Boy, Girl
        /*----- Animals -----*/
        case Rat, Mouse, Ox, Buffalo, Cow, Tiger, Leopard
        case Rabbit, Cat, Dragon, Crocodile, Whale, Snail, Snake
        case Horse, Ram, Goat, Sheep, Monkey, Rooster, Chicken
        case Dog, Pig, Boar, Elephant, Octopus, Shell, Bug
        case Ant, HoneyBee, LadyBug, Fish, TropicalFish, BlowFish, Turtle
        case HatchingChick, BabyChick, BabyChick1, Bird, Penguin, Koala, Poodle
        case Camel, Camel1, Dolphin, Chipmunk, Crab, Scorpion
        case Turkey, Eagle, Duck, Bat, Shark, Owl, Butterfly
        case Lizard, Shrimp, Squid
        /*----- Animal Faces -----*/
        case MouseFace, CowFace, TigerFace, RabbitFace,CatFace
        case DragonFace, WhaleFace, HorseFace, MonkeyFace, DogFace
        case PigFace, FrogFace, HamsterFace, WolfFace, BearFace
        case PandaFace, LionFace, UnicornFace, FoxFace, DeerFace
        case GorillaFace, RhinocerosFace
        /*----- Clothes -----*/
        case Crown, WomanHat, Glasses, Necttie, TShirt
        case Jeans, Dress, Kimono, Bikini, WomanCloth
        case Purse, Handbag, Pouch, ManShoe, AthleticShoe
        case HighHeeledShoe, WomanSandal, Boots, MartialArtsUniform
        case TopHat
        /*----- Medals -----*/
        case FirstPlaceMedal, SecondPlaceMedal, ThirdPlaceMedal
        case Trophy, Medal, Ribbon
        case Victory, ThumbUp
    }
    
    static func getUnicodeIcon(key: UnicodeIconKey) -> String {
        return unicodes[key]!
    }
    
    static func getUnicodeIcon(key: UnicodeIconKey, str: String) -> String {
        return unicodes[key]! + " " + str
    }
    
    static let unicodes: Dictionary<UnicodeIconKey, String> = [
        UnicodeIconKey.Enclosed0 :   "\u{24EA}", //⓪
        UnicodeIconKey.Enclosed1 :   "\u{2460}", //①
        UnicodeIconKey.Enclosed2 :   "\u{2461}", //②
        UnicodeIconKey.Enclosed3 :   "\u{2462}", //③
        UnicodeIconKey.Enclosed4 :   "\u{2463}", //④
        UnicodeIconKey.Enclosed5 :   "\u{2464}", //⑤
        UnicodeIconKey.Enclosed6 :   "\u{2465}", //⑥
        UnicodeIconKey.Enclosed7 :   "\u{2466}", //⑦
        UnicodeIconKey.Enclosed8 :   "\u{2467}", //⑧
        UnicodeIconKey.Enclosed9 :   "\u{2468}", //⑨
        UnicodeIconKey.SquareRoot:   "\u{221A}", //√
        UnicodeIconKey.Addition :    "\u{2795}", //➕
        UnicodeIconKey.Substract :   "\u{2796}", //➖
        UnicodeIconKey.Divide :      "\u{2797}", //➗
        UnicodeIconKey.Multiple :    "\u{2716}", //✖
        UnicodeIconKey.Mod:          "\u{2052}", //⁒
        UnicodeIconKey.Dot :         "\u{05C5}", //ׅ
        
        UnicodeIconKey.SadFace :     "\u{1F61E}", //"\u{2639}", //☹
        UnicodeIconKey.HappyFace:    "\u{1F603}",//"\u{263A}", //☺
        UnicodeIconKey.ThinkingFace: "\u{1F914}",
        UnicodeIconKey.GrinningFace :   "\u{1F600}",
        UnicodeIconKey.SmileHornFace :  "\u{1F608}",
        UnicodeIconKey.WinkingFace :    "\u{1F609}",
        UnicodeIconKey.AngryFace :      "\u{1F620}",
        UnicodeIconKey.CryingFace :     "\u{1F622}",
        UnicodeIconKey.FearfulFace :    "\u{1F628}",
        UnicodeIconKey.ScreamingFace :  "\u{1F631}",
        UnicodeIconKey.AstonishedFace : "\u{1F633}",
        UnicodeIconKey.SleepingFace :   "\u{1F634}",
        
        UnicodeIconKey.Delete :      "\u{2421}", // ␡
        UnicodeIconKey.Enter :       "\u{23CE}", //⏎
        UnicodeIconKey.Ack :         "\u{2611}", //"\u{2406}", //␆
        UnicodeIconKey.Close :       "\u{274E}",//"\u{274E}", //❎
        UnicodeIconKey.Checked :     "\u{2714}", //✔
        UnicodeIconKey.HeavyBallotX: "\u{2718}",
        UnicodeIconKey.Info :       "\u{24D8}",//"\u{1F6C8}", //ⓘ
        UnicodeIconKey.Info1:       "\u{2148}",//ⅈ
        UnicodeIconKey.Setting :    "\u{2699}",
        UnicodeIconKey.Setting1 :   "\u{2692}",
        UnicodeIconKey.Search:             "\u{1F50D}",
        UnicodeIconKey.Search1:            "\u{1F50E}",
        UnicodeIconKey.Warning:     "\u{26A0}",
        UnicodeIconKey.Alarm:       "\u{23F0}",
        UnicodeIconKey.Alert:       "\u{20DD}",
        UnicodeIconKey.Uncertainty: "\u{2BD1}",
        UnicodeIconKey.HeavyExclamation:    "\u{2757}",
        UnicodeIconKey.Recycle:     "\u{267B}",
        UnicodeIconKey.RecycleWithCircle: "\u{267D}",
        UnicodeIconKey.Blocking:    "\u{26D4}",
        UnicodeIconKey.Reset:       "\u{21BA}",
        UnicodeIconKey.QuestionWhite:   "\u{2754}",
        UnicodeIconKey.Eject:           "\u{23CF}",
        
        UnicodeIconKey.ArrowLeft :   "\u{21E6}", //⇦
        UnicodeIconKey.ArrowUp :     "\u{21E7}", //⇧
        UnicodeIconKey.ArrowRight:   "\u{21E8}", //⇨
        UnicodeIconKey.ArrowRight1 : "\u{2710}", //➠
        UnicodeIconKey.ArrowDown :   "\u{21E9}", //⇩
        UnicodeIconKey.ArrowUpAndDown: "\u{21F3}",
        UnicodeIconKey.ArrowBack :      "\u{1F519}",
        UnicodeIconKey.ArrowTop :       "\u{1F51D}",
        UnicodeIconKey.RightPointing:   "\u{261E}",
        UnicodeIconKey.UpTriangle:      "\u{25B3}",
        UnicodeIconKey.DownTriangle:    "\u{25BD}",
        UnicodeIconKey.Checkedbox:      "\u{2611}",
        UnicodeIconKey.Uncheckedbox:    "\u{2610}",
        UnicodeIconKey.Help:            "\u{2753}",//"\u{2705}",
        UnicodeIconKey.StopPlay:        "\u{23F9}",
        UnicodeIconKey.StartPlay:          "\u{23E9}",
        UnicodeIconKey.PausePlay:       "\u{23F8}",
        UnicodeIconKey.RecordPlay:      "\u{23FA}",
        UnicodeIconKey.EnclosedNew:     "\u{1F195}",
        
        UnicodeIconKey.Snow1 :       "\u{2744}", //❄
        UnicodeIconKey.Snow :       "\u{2746}", //❆
        UnicodeIconKey.Rain :        "\u{2614}", //☔
        UnicodeIconKey.Sun :         "\u{2600}", //☀
        UnicodeIconKey.Cloud :       "\u{2601}", //☁
        UnicodeIconKey.Rainbow:            "\u{1F308}",
        UnicodeIconKey.FullMoon:            "\u{1F315}",
        UnicodeIconKey.CrescentMoon:            "\u{1F319}",
        UnicodeIconKey.MoonWithFace:            "\u{1F31B}",
        UnicodeIconKey.SunWithFace:            "\u{1F31E}",
        UnicodeIconKey.GlowingStar:            "\u{1F31F}",
        UnicodeIconKey.ShootingStar:            "\u{1F320}",
        UnicodeIconKey.CloudWithRain:            "\u{1F327}",
        UnicodeIconKey.WhiteSun:            "\u{1F323}",
        UnicodeIconKey.CloudWithSnow:            "\u{1F328}",
        UnicodeIconKey.SunWithCloud:            "\u{1F324}",
        UnicodeIconKey.Lighting:            "\u{1F329}",
        UnicodeIconKey.Tornado:            "\u{1F32A}",
        UnicodeIconKey.BlackStar:           "\u{2605}",
        UnicodeIconKey.WhiteStar:           "\u{2606}",
        UnicodeIconKey.SnowMan:             "\u{26C4}",
        
        UnicodeIconKey.Celsius :        "\u{2103}",
        UnicodeIconKey.Fahrenheit :     "\u{2109}",
        
        UnicodeIconKey.LockKey :        "\u{1F510}",
        UnicodeIconKey.Key :            "\u{1F511}",
        UnicodeIconKey.Lock :           "\u{1F512}",
        UnicodeIconKey.Unlock :         "\u{1F513}",
        
        UnicodeIconKey.Bell :           "\u{1F514}",
        UnicodeIconKey.Unbell :         "\u{1F515}",
        
        UnicodeIconKey.Bookmark :       "\u{1F516}",
        UnicodeIconKey.Book:            "\u{1F56E}",
        
        UnicodeIconKey.Door:            "\u{1F6AA}",
        
        UnicodeIconKey.MediumShade:     "\u{2592}",
        UnicodeIconKey.CopyRight:       "\u{00A9}",
        UnicodeIconKey.RegisteredSign:  "\u{00AE}",
        
        UnicodeIconKey.BlueBook:        "\u{1F4D8}",
        UnicodeIconKey.OpenBook:        "\u{1F4D6}",
        UnicodeIconKey.ClosedBook:      "\u{1F4D5}",
        
        UnicodeIconKey.House :          "\u{1F3E0}",
        UnicodeIconKey.HouseTree :      "\u{1F3E1}",
        UnicodeIconKey.Family:            "\u{1F46A}",
        UnicodeIconKey.Couple:            "\u{1F46B}",
        UnicodeIconKey.Friend:            "\u{1F46C}",
        UnicodeIconKey.Friend1:            "\u{1F46D}",
        UnicodeIconKey.PersonWithBall:      "\u{26F9}",
        UnicodeIconKey.Boy:                 "\u{1F466}",
        UnicodeIconKey.Girl:                "\u{1F467}",
        
        UnicodeIconKey.Rat :            "\u{1F400}",
        UnicodeIconKey.Mouse :            "\u{1F401}",
        UnicodeIconKey.Ox :            "\u{1F402}",
        UnicodeIconKey.Buffalo :            "\u{1F403}",
        UnicodeIconKey.Cow :            "\u{1F404}",
        UnicodeIconKey.Tiger :            "\u{1F405}",
        UnicodeIconKey.Leopard :            "\u{1F406}",
        UnicodeIconKey.Rabbit :            "\u{1F407}",
        UnicodeIconKey.Cat :            "\u{1F408}",
        UnicodeIconKey.Dragon :            "\u{1F409}",
        UnicodeIconKey.Crocodile :            "\u{1F40A}",
        UnicodeIconKey.Whale :            "\u{1F40B}",
        UnicodeIconKey.Snail :            "\u{1F40C}",
        UnicodeIconKey.Snake :            "\u{1F40D}",
        UnicodeIconKey.Horse :            "\u{1F40E}",
        UnicodeIconKey.Ram :             "\u{1F40F}",
        UnicodeIconKey.Goat :            "\u{1F410}",
        UnicodeIconKey.Sheep :            "\u{1F411}",
        UnicodeIconKey.Monkey :            "\u{1F412}",
        UnicodeIconKey.Rooster :            "\u{1F413}",
        UnicodeIconKey.Chicken :            "\u{1F414}",
        UnicodeIconKey.Dog :            "\u{1F415}",
        UnicodeIconKey.Pig :            "\u{1F416}",
        UnicodeIconKey.Boar :            "\u{1F417}",
        UnicodeIconKey.Elephant :            "\u{1F418}",
        UnicodeIconKey.Octopus :            "\u{1F419}",
        UnicodeIconKey.Shell :            "\u{1F41A}",
        UnicodeIconKey.Bug :            "\u{1F41B}",
        UnicodeIconKey.Ant:            "\u{1F41C}",
        UnicodeIconKey.HoneyBee:            "\u{1F41D}",
        UnicodeIconKey.LadyBug:            "\u{1F41E}",
        UnicodeIconKey.Fish:            "\u{1F41F}",
        UnicodeIconKey.TropicalFish:            "\u{1F420}",
        UnicodeIconKey.BlowFish:            "\u{1F421}",
        UnicodeIconKey.Turtle:            "\u{1F422}",
        UnicodeIconKey.HatchingChick:            "\u{1F423}",
        UnicodeIconKey.BabyChick:            "\u{1F424}",
        UnicodeIconKey.BabyChick1:            "\u{1F425}",
        UnicodeIconKey.Bird:            "\u{1F426}",
        UnicodeIconKey.Penguin:            "\u{1F427}",
        UnicodeIconKey.Koala:            "\u{1F428}",
        UnicodeIconKey.Poodle:            "\u{1F429}",
        UnicodeIconKey.Camel:            "\u{1F42A}",
        UnicodeIconKey.Camel1:            "\u{1F42B}",
        UnicodeIconKey.Dolphin:            "\u{1F42C}",
        UnicodeIconKey.Chipmunk:            "\u{1F43F}",
        UnicodeIconKey.Crab:            "\u{1F980}",
        UnicodeIconKey.Scorpion:            "\u{1F982}",
        UnicodeIconKey.Turkey:            "\u{1F983}",
        UnicodeIconKey.Eagle:            "\u{1F985}",
        UnicodeIconKey.Duck:            "\u{1F986}",
        UnicodeIconKey.Bat:            "\u{1F987}",
        UnicodeIconKey.Shark:            "\u{1F988}",
        UnicodeIconKey.Owl:            "\u{1F989}",
        UnicodeIconKey.Butterfly:            "\u{1F98B}",
        UnicodeIconKey.Lizard:            "\u{1F98E}",
        UnicodeIconKey.Shrimp:            "\u{1F990}",
        UnicodeIconKey.Squid:            "\u{1F991}",
        
        UnicodeIconKey.MouseFace:            "\u{1F42D}",
        UnicodeIconKey.CowFace:            "\u{1F42E}",
        UnicodeIconKey.TigerFace:            "\u{1F42F}",
        UnicodeIconKey.RabbitFace:            "\u{1F430}",
        UnicodeIconKey.CatFace:            "\u{1F431}",
        UnicodeIconKey.DragonFace:            "\u{1F432}",
        UnicodeIconKey.WhaleFace:            "\u{1F433}",
        UnicodeIconKey.HorseFace:            "\u{1F434}",
        UnicodeIconKey.MonkeyFace:            "\u{1F435}",
        UnicodeIconKey.DogFace:            "\u{1F436}",
        UnicodeIconKey.PigFace:            "\u{1F437}",
        UnicodeIconKey.FrogFace:            "\u{1F438}",
        UnicodeIconKey.HamsterFace:            "\u{1F439}",
        UnicodeIconKey.WolfFace:            "\u{1F43A}",
        UnicodeIconKey.BearFace:            "\u{1F43B}",
        UnicodeIconKey.PandaFace:            "\u{1F43C}",
        UnicodeIconKey.LionFace:            "\u{1F981}",
        UnicodeIconKey.UnicornFace:            "\u{1F984}",
        UnicodeIconKey.FoxFace:            "\u{1F98A}",
        UnicodeIconKey.DeerFace:            "\u{1F98C}",
        UnicodeIconKey.GorillaFace:            "\u{1F98D}",
        UnicodeIconKey.RhinocerosFace:            "\u{1F98F}",
        
        UnicodeIconKey.Crown:            "\u{1F451}",
        UnicodeIconKey.WomanHat:            "\u{1F452}",
        UnicodeIconKey.Glasses:            "\u{1F453}",
        UnicodeIconKey.Necttie:            "\u{1F454}",
        UnicodeIconKey.TShirt:            "\u{1F455}",
        UnicodeIconKey.Jeans:            "\u{1F456}",
        UnicodeIconKey.Dress:            "\u{1F457}",
        UnicodeIconKey.Kimono:            "\u{1F458}",
        UnicodeIconKey.Bikini:            "\u{1F459}",
        UnicodeIconKey.WomanCloth:            "\u{1F45A}",
        UnicodeIconKey.Purse:            "\u{1F45B}",
        UnicodeIconKey.Handbag:            "\u{1F45C}",
        UnicodeIconKey.Pouch:            "\u{1F45D}",
        UnicodeIconKey.ManShoe:            "\u{1F45E}",
        UnicodeIconKey.AthleticShoe:            "\u{1F45F}",
        UnicodeIconKey.HighHeeledShoe:            "\u{1F460}",
        UnicodeIconKey.WomanSandal:            "\u{1F461}",
        UnicodeIconKey.Boots:            "\u{1F462}",
        UnicodeIconKey.MartialArtsUniform: "\u{1F94B}",
        UnicodeIconKey.TopHat:            "\u{1F3A9}",
        
        UnicodeIconKey.FirstPlaceMedal:            "\u{1F947}",
        UnicodeIconKey.SecondPlaceMedal:            "\u{1F948}",
        UnicodeIconKey.ThirdPlaceMedal:            "\u{1F949}",
        UnicodeIconKey.Trophy:            "\u{1F3C6}",
        UnicodeIconKey.Medal:            "\u{1F396}",
        UnicodeIconKey.Ribbon:            "\u{1F397}",
        UnicodeIconKey.Victory:         "\u{270C}",
        UnicodeIconKey.ThumbUp:         "\u{1F44D}"
    ]
}
