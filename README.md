# Info League SWIFT
Info league application using Swift with Clean Architecture

# Library Using
| Name      | Sources                                | Description                                                                        |
|-----------|----------------------------------------|------------------------------------------------------------------------------------|
| Alamofire | https://github.com/Alamofire/Alamofire | Alamofire is an HTTP networking library written in Swift.                          |
| Realm     | https://github.com/realm/realm-swift   | Realm is a mobile database that runs directly inside phones, tablets or wearables. |
| RxSwift   | https://github.com/ReactiveX/RxSwift   | Reactive Programming                                                               |

# Project Tree
```bash
── App
│   ├── AppDelegate.swift
│   └── SceneDelegate.swift
├── Core
│   ├── DI
│   │   └── Injection.swift
│   ├── Data
│   │   ├── LeaguesRepository.swift
│   │   ├── Locale
│   │   │   ├── Entity
│   │   │   │   └── LeaguesEntity.swift
│   │   │   └── LocaleDataSources.swift
│   │   └── Remote
│   │       ├── RemoteDataSources.swift
│   │       └── Response
│   │           ├── ClubResponse.swift
│   │           └── LeaguesResponse.swift
│   ├── Domain
│   │   ├── Model
│   │   │   ├── ClubModel.swift
│   │   │   └── LeaguesModel.swift
│   │   └── UseCase
│   │       ├── ClubInteractor.swift
│   │       └── LeaguesInteractor.swift
│   └── Utils
│       ├── Extensions
│       │   └── CustomError+Ext.swift
│       ├── ImageLoader.swift
│       ├── Mapper
│       │   ├── ClubMapper.swift
│       │   └── LeaguesMapper.swift
│       └── Network
│           └── APICall.swift
├── Module
│   ├── Club
│   │   ├── Cell
│   │   │   └── ClubCollectionViewCell.swift
│   │   ├── ClubViewController.swift
│   │   └── Presenter
│   │       └── ClubPresenter.swift
│   └── Leagues
│       ├── Cell
│       │   └── LeagueCollectionViewCell.swift
│       ├── Presenter
│       │   └── LeaguesPresenter.swift
│       └── ViewController.swift
└── Supporting Files
    ├── Assets.xcassets
    │   ├── AccentColor.colorset
    │   │   └── Contents.json
    │   ├── AppIcon.appiconset
    │   │   └── Contents.json
    │   └── Contents.json
    ├── Base.lproj
    │   ├── LaunchScreen.storyboard
    │   └── Main.storyboard
    └── Info.plist
```
# Screen shoot App
![ezgif com-video-to-gif (1)](https://github.com/primajatnika27/info-league-swift/assets/51253537/6ab10f49-8fcf-4613-95b8-75d5c29bb13a)

