<?php

namespace Drupal\article\Controller;

use Drupal\Core\Controller\ControllerBase;
use Drupal\node\NodeInterface;
use Drupal\Core\Render\Markup;
use Drupal\Core\Access\AccessResult;

/**
 * Class articleController.
 *
 * @package Drupal\article\Controller.
 */
class articleController extends ControllerBase {

  /**
   * @param \Drupal\node\NodeInterface $node
   *
   * @return array
   */
  public function content(NodeInterface $node) {

    $res['title'] = $node->getTitle();
    $res['body'] = $node->get('body')->value;
    $res['img_path'] = file_create_url($node->field_image->entity->getFileUri());
    $tags = $node->field_tags[0]->getValue();
    $res['tid'] = $tags['target_id'];
    $tid = $tags['target_id'];
    $term = \Drupal::entityTypeManager()->getStorage('taxonomy_term')->load($tid);
    $res['term'] = $term->label();
    return [
      '#theme' => 'my_theme',
      '#node' => $res,
      '#title' => Markup::create('<h1>' . $res['title'] . '</h1>'),
      '#attached' => [
        'library' => [
          'article/article_css',
        ],
      ],
    ];
  }

  /**
   * Function for custom access.
   * @return access
   */
  public function access() {

    $today = date("Y-m-d H:i:s");
    $date = "2018-12-09 00:00:00";
    if ($date < $today) {
      return AccessResult::forbidden();
    }
    return AccessResult::allowed();
  }

}
