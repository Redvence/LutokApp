//
//  ProfileStorage.swift
//  lutok2
//

import Foundation

protocol ProfileStorageLogic {
    func save(_ profile: ProfileModel)
    func read() -> ProfileModel
}

class ProfileStorageWorker: ProfileStorageLogic
{
    /// Keys for userDefault dictionary.
    private struct Keys {
        static let firstName = "Имя"
        static let avatar = "Аватарка"
        static let secondName = "Отчество"
        static let middleName = "Фамилия"
        static let alias = "Ник"
        static let mail = "Электронная почта"
        static let phone = "Номер телефона"
        static let telegram = "Телеграм"
    }

    /// Save profile to userDefaults.
    func save(_ profile: ProfileModel) {
        let avatar: String = profile.avatar ?? ""
        UserDefaults.standard.set(profile.firstName, forKey: Keys.firstName)
        UserDefaults.standard.set(profile.secondName, forKey: Keys.secondName)
        UserDefaults.standard.set(profile.middleName, forKey: Keys.middleName)
        UserDefaults.standard.set(avatar, forKey: Keys.avatar)
        UserDefaults.standard.set(profile.alias, forKey: Keys.alias)
        UserDefaults.standard.set(profile.mail, forKey: Keys.mail)
        UserDefaults.standard.set(profile.phone, forKey: Keys.phone)
        UserDefaults.standard.set(profile.telegram, forKey: Keys.telegram)
    }

    /// Read profile from userDefaults.
    func read() -> ProfileModel {
        let firstName = UserDefaults.standard.string(forKey: Keys.firstName)
        let secondName = UserDefaults.standard.string(forKey: Keys.secondName)
        let middleName = UserDefaults.standard.string(forKey: Keys.middleName)
        let avatar = UserDefaults.standard.string(forKey: Keys.avatar)
        let alias = UserDefaults.standard.string(forKey: Keys.alias)
        let mail = UserDefaults.standard.string(forKey: Keys.mail)
        let phone = UserDefaults.standard.string(forKey: Keys.phone)
        let telegram = UserDefaults.standard.string(forKey: Keys.telegram)

        return ProfileModel(
            avatar: avatar,
            firstName: firstName ?? "",
            secondName: secondName ?? "",
            middleName: middleName ?? "",
            alias: alias ?? "",
            mail: mail ?? "",
            phone: phone ?? "",
            telegram: telegram ?? ""
        )
    }
}
