// Generated using Sourcery 0.15.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// MARK: HomeScreenCellType

internal extension HomeScreenCellType {
    enum CaseName: String {
        case item
        case childItem
        case loading
    }
    var caseName: CaseName {
        switch self {
        case .item: return .item
        case .childItem: return .childItem
        case .loading: return .loading
        }
    }
}

