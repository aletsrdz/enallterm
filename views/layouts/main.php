<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use app\assets\AppAsset;
use yii\bootstrap\Alert;
use yii\models\User;
use yii\db\ActiveRecord;
use yii\helpers\ArrayHelper;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?php $this->registerCsrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body>
<?php $this->beginBody() ?>

<div class="wrap">
    <?php
    NavBar::begin([
        'brandLabel' => '<img src="'.Yii::$app->homeUrl.'/../images/UNAM.png" border="1" alt="logo" width="100" height="100">',
        'brandUrl' => Yii::$app->homeUrl,
        'options' => [
            'class' => 'navbar', //navbar navbar-fixed-top
        ],
    ]);
    echo Nav::widget([
        'options' => ['class' => 'navbar-nav navbar-right'],
        'items' => [
            ['label' => 'Inicio', 'url' => ['/site/index']],
            ['label' => 'About', 'url' => ['/site/about'], 'visible'=>Yii::$app->user->can('super')],
            ['label' => 'Contact', 'url' => ['/site/contact'], 'visible'=>Yii::$app->user->can('super')],            
            [
                'label' => 'Catalogos',
                'visible'=> Yii::$app->user->can('super'),
                'items' => [
                     ['label' => 'Areas', 'url' => '#'],
                     ['label' => 'Subareas', 'url' => '#'],
                     ['label' => 'Paises', 'url' => '/site/check'],
                     '<li class="divider"></li>',
                     '<li class="dropdown-header">Administración</li>',
                     ['label' => 'Lista de permisos', 'url' => './check'],
                ],
            ],
            Yii::$app->user->isGuest ? (
                ['label' => 'Login', 'url' => ['/site/login']]
            ) : (
                '<li>'
                . Html::beginForm(['/site/logout'], 'post')
                . Html::submitButton(
                    'Logout (' . Yii::$app->user->identity->username . ')',
                    ['class' => 'btn btn-link logout']
                )
                . Html::endForm()
                . '</li>'
            ),
            ['label' => 'Registrarse', 'url'=>['/site/register']],
        ],
    ]);
    NavBar::end();
    ?>

    <div class="container">
        <?= Breadcrumbs::widget([
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ]) ?>

        <?php if(!empty(Yii::$app->session->getFlash('success'))){
                echo Alert::widget([
                    'options'=>['class'=>'alert-success alert-dismissible'],    
                    'body'=> Yii::$app->session->getFlash('success')
                    ]);
                }?>
            
        <?= $content ?>
    </div>
</div>

<footer class="footer">
    <div class="container">
        <p class="pull-left">&copy; My Company <?= date('Y') ?></p>

        <p class="pull-right"><?= Yii::powered() ?></p>
    </div>
</footer>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
