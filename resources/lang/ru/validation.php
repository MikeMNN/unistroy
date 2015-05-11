<?php

return array(

    /*
    |--------------------------------------------------------------------------
    | Validation Language Lines
    |--------------------------------------------------------------------------
    |
    | The following language lines contain the default error messages used by
    | the validator class. Some of these rules have multiple versions such
    | such as the size rules. Feel free to tweak each of these messages.
    |
    */

    "accepted"             => ":attribute должен быть подтвержден.",
    "active_url"           => ":attribute неверный URL.",
    "after"                => ":attribute должна быть датой после :date.",
    "alpha"                => ":attribute может содержать только буквы.",
    "alpha_dash"           => ":attribute может содержать только буквы, цифры и пробелы.",
    "alpha_num"            => ":attribute может содержать только цифпы и буквы.",
    "array"                => ":attribute должно быть массивом.",
    "before"               => ":attribute должна быть датой до :date.",
    "between"              => array(
        "numeric" => ":attribute должен быть между :min и :max.",
        "file"    => ":attribute должно быыть между :min и :max килобайт.",
        "string"  => ":attribute должно быть от :min до :max символов.",
        "array"   => ":attribute должно быть от :min до :max элементов."
    ),
    "boolean"              => ":attribute поле должно содержать правда или ложь",
    "confirmed"            => "Подтверждение :attribute не совпадает.",
    "date"                 => ":attribute неправильная дата.",
    "date_format"          => ":attribute не совпадает формат :format.",
    "different"            => ":attribute и :other должны быть различны.",
    "digits"               => ":attribute должен быть :digits цифрой.",
    "digits_between"       => ":attribute должен быть от :min до :max.",
    "email"                => ":attribute должен быть корректным.",
    "exists"               => "Требуется поле :attribute.",
    "image"                => ":attribute должна быть картинка.",
    "in"                   => "Выбранный :attribute недоступен.",
    "integer"              => ":attribute должно быть целочисленным.",
    "ip"                   => ":attribute doit être une adresse IP valide.",
    "max"                  => array(
        "numeric" => "La valeur de :attribute ne peut être supérieure à :max.",
        "file"    => "Le fichier :attribute ne peut être plus gros que :max kilobytes.",
        "string"  => "Le texte de :attribute ne peut contenir plus de :max caractères.",
        "array"   => ":attribute ne peut avoir plus de :max éléments.",
    ),
    "mimes"                => ":attribute doit être un fichier de type : :values.",
    "min"                  => array(
        "numeric" => "La valeur de :attribute doit être supérieure à :min.",
        "file"    => "Le fichier :attribute doit être plus que gros que :min kilobytes.",
        "string"  => "Le texte :attribute doit contenir au moins :min caractères.",
        "array"   => ":attribute doit avoir au moins :min éléments."
    ),
    "not_in"               => ":attribute неверный аттрибут.",
    "numeric"              => ":attribute должен быть числом.",
    "regex"                => ":attribute неверный формат.",
    "required"             => "Нужно указать :attribute.",
    "required_if"          => ":attribute est obligatoire quand la valeur de :other est :value.",
    "required_with"        => ":attribute est obligatoire quand :values est présent.",
    "required_with_all"    => ":attribute est obligatoire quand :values est présent.",
    "required_without"     => ":attribute est obligatoire quand :values n'est pas présent.",
    "required_without_all" => ":attribute est requis quand aucun de :values n'est présent.",
    "same"                 => "Les champs :attribute et :other doivent être identiques.",
    "size"                 => array(
        "numeric" => "La valeur de :attribute doit être :size.",
        "file"    => "La taille du fichier de :attribute doit être de :size kilobytes.",
        "string"  => "Le texte de :attribute doit contenir :size caractères.",
        "array"   => ":attribute doit contenir :size éléments."
    ),
    "tags"                 => "Les mots-clefs, séparés par des virgules (sans espaces), doivent avoir au maximum 50 caractères alphanumériques.",
    "timezone"             => ":attribute doit être une zone valide.",
    "unique"               => ":attribute уже существует.",
    "url"                  => ":attribute неправильный формат.",

    /*
    |--------------------------------------------------------------------------
    | Custom Validation Language Lines
    |--------------------------------------------------------------------------
    |
    | Here you may specify custom validation messages for attributes using the
    | convention "attribute.rule" to name the lines. This makes it quick to
    | specify a specific custom language line for a given attribute rule.
    |
    */

    'custom' => array(
        'attribute-name' => array(
            'rule-name' => 'custom-message',
        ),
    ),

    /*
    |--------------------------------------------------------------------------
    | Custom Validation Attributes
    |--------------------------------------------------------------------------
    |
    | The following language lines are used to swap attribute place-holders
    | with something more reader friendly such as E-Mail Address instead
    | of "email". This simply helps us make messages a little cleaner.
    |
    */

    'attributes' => array(
        "name" => "Имя",
        "username" => "Никнейм",
        "email" => "E-mail",
        "first_name" => "Имя",
        "last_name" => "Фамилия",
        "password" => "Пароль",
        "password_confirmation" => "Подтверждения пароля",
        "city" => "Город",
        "country" => "Страна",
        "address" => "Адрес",
        "phone" => "Телефон",
        "mobile" => "Мобильный",
        "age" => "Возраст",
        "sex" => "Пол",
        "gender" => "Пол",
        "day" => "День",
        "month" => "Месяц",
        "year" => "Год",
        "hour" => "Час",
        "minute" => "Минута",
        "second" => "Секунда",
        "title" => "Заголовок",
        "content" => "Контент",
        "description" => "Описание",
        "excerpt" => "Отрывок",
        "date" => "Дата",
        "time" => "Время",
        "available" => "Доступен",
        "size" => "Размер",
        "log" => "E-mail или Никнейм"
    ),

);
