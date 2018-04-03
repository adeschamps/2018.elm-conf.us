module View.Headers exposing (innerPage)

import App exposing (Msg)
import Css exposing (..)
import Html.Styled as Html exposing (Attribute, Html)
import Html.Styled.Attributes exposing (css)
import Route exposing (Route)
import Styles.Colors as Colors
import Styles.Text as Text
import View.Elements as Elements


innerPage : Html Msg
innerPage =
    Html.header
        [ css [ marginBottom (Text.scale 4) ] ]
        [ Html.div
            [ css
                [ backgroundImage <|
                    linearGradient2
                        (deg 90)
                        (stop Colors.peach)
                        (stop Colors.orange)
                        []
                , height (px 5)
                , marginBottom (Text.scale 1)
                ]
            ]
            []
        , navBar DarkOnLight
        ]


type NavVariant
    = DarkOnLight
    | LightOnDark


navBar : NavVariant -> Html Msg
navBar variant =
    Html.div
        [ css
            [ width Text.fullSize
            , margin2 zero auto
            , displayFlex
            , justifyContent spaceBetween
            , alignItems center
            ]
        ]
        [ navLogo variant
        , navLinks variant
        ]


navLogo : NavVariant -> Html Msg
navLogo variant =
    navLink variant Route.index <|
        Html.span
            [ css
                [ fontSize (Text.scale 2)
                , fontWeight (int 600)
                ]
            ]
            [ Html.text "elm-conf" ]


navLinks : NavVariant -> Html Msg
navLinks variant =
    Html.nav []
        [ navLink variant Route.about <| Html.text "about"
        , navLink variant Route.speakAtElmConf <| Html.text "speak at elm-conf"
        ]


navLink : NavVariant -> Route -> Html Msg -> Html Msg
navLink variant route caption =
    Elements.link
        route
        [ css
            [ padding (Text.scale 0.5)
            , firstChild [ paddingLeft zero ]
            , lastChild [ paddingRight zero ]
            ]
        , Text.a
        , case variant of
            DarkOnLight ->
                css []

            LightOnDark ->
                css [ color Colors.white ]
        ]
        [ caption ]