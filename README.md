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
![Simulator Screen Recording - iPhone 14 - 2023-11-22 at 19 31 26](https://github.com/primajatnika27/info-league-swift/assets/51253537/6dacff77-c824-4622-ad64-488c7095e703)
