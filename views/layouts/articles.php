<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use app\assets\AppAsset;
use yii\bootstrap\Alert;
use host33\multilevelverticalmenu\MultilevelVerticalMenu;

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
	    /*
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
            ['label' => 'About', 'url' => ['/site/about']],
            ['label' => 'Contact', 'url' => ['/site/contact']],            
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
    */
    ?>
    <div class="container">

        <?php if(!empty(Yii::$app->session->getFlash('success'))){
                echo Alert::widget([
                    'options'=>['class'=>'alert-success alert-dismissible'],    
                    'body'=> Yii::$app->session->getFlash('success')
                    ]);
                }
        ?>            
	    <div class="col-xs-8">
			<?= $content ?>
		</div>
		<div class="col-xs-4">
			<h4>Table of contents</h4>
			<?php
			/*
				echo MultilevelVerticalMenu::widget(
				array(
				"menu"=>array(
				  array("url"=>array(),
				               "label"=>"Products",
				          array("url"=>array(
				                       "route"=>"/product/create"),
				                       "label"=>"Create product",),
				          array("url"=>array(
				                      "route"=>"/product/list"),
				                      "label"=>"Product List",),
				          array("url"=>array(),
				                       "label"=>"View Products",
				          array("url"=>array(
				                       "route"=>"/product/show",
				                       "params"=>array("id"=>3),
				                       "htmlOptions"=>array("title"=>"title")),
				                       "label"=>"Product 3"),
				            array("url"=>array(),
				                         "label"=>"Product 4",
				                array("url"=>array(
				                             "route"=>"/product/show",
				                             "params"=>array("id"=>5)),
				                             "label"=>"Product 5")))),
				          array("url"=>array(
				                       "route"=>"/event/create"),
				                       "label"=>"Sales"),
				          array("url"=>array(
				                       "route"=>"/event/create"),
				                       "label"=>"Extensions",
				                       "visible"=>false),
				          array("url"=>array(),
				                       "label"=>"Documentation",
				              array("url"=>array(
				                           "link"=>"http://www.yiiframework.com",
				                           "htmlOptions"=>array("target"=>"_BLANK")),
				                           "label"=>"Yii Framework"),
				          array("url"=>array(),
				                       "label"=>"Clothes",
				          array("url"=>array(
				                       "route"=>"/product/men",
				                       "params"=>array("id"=>3),
				                       "htmlOptions"=>array("title"=>"title")),
				                       "label"=>"Men"),
				            array("url"=>array(),
				                         "label"=>"Women",
				                array("url"=>array(
				                             "route"=>"/product/scarves",
				                             "params"=>array("id"=>5)),
				                             "label"=>"Scarves"))),
				              array("url"=>array(
				                           "route"=>"site/menuDoc"),
				                           "label"=>"Disabled Link",
										   "disabled"=>true),
				                )
				          ),
				    "transition" => 1 // To choose between 1,2,3,4 and 5. 
				)
				);
			*/
			?>
			<ol>
				<li><a href="#intro">Introduction</a></li>
				<li><a href="#quick-start">Quick start</a></li>
				<li>..</li>
			</ol>
		</div>
    </div>
</div>


<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>