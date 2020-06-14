<?php

namespace App\Controller;

use App\Entity\Comment;
use App\Entity\Post;
use App\Form\CommentType;
use App\Form\PostType;
use App\Repository\PostRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/")
 */
class PostController extends AbstractController
{
    /**
     * @Route("/", name="index", methods={"GET"})
     */
    public function index(PostRepository $postRepository): Response
    {
        $posts = $postRepository->findBy(['is_published' => Post::PUBLISHED], ['create_at' =>'DESC']);
        foreach ($posts as $post ) {
            $post->setCountComments($this->generateCountComments($post->getId()));
        }
        return $this->render('index.html.twig', [
            'posts' => $posts,
        ]);
    }


    /**
     * @Route("post/{id}", name="post_show", methods={"GET","POST"})
     */
    public function show(Request $request): Response
    {
        $comment = new Comment();
        $post = $this->getDoctrine()->getRepository(Post::class)->find($request->get('id'));
        $post->setViews($post->getViews() + 1);
        $post->setCountComments($this->generateCountComments($post->getId()));
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($post);
        $entityManager->flush();

        $form = $this->createForm(CommentType::class, $comment);
        $form->handleRequest($request);
        $comments = $this->getDoctrine()->getRepository(Comment::class)->findBy(
            ['post' => $post->getId()], ['create_at' =>'ASC']
        );
        if ($form->isSubmitted() && $form->isValid()) {
            $comment->setCreateAtValue();
            $comment->setUser($this->getUser());
            $comment->setPost($post);

            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($comment);
            $entityManager->flush();

            return $this->redirect('/post/' . $post->getId());
        }

        return $this->render('post/show.html.twig', [
            'post' => $post,
            'comments' => $comments,
            'commentForm' => $form->createView()
        ]);

    }

    private function generateCountComments($idPost): int
    {
        $comments = $this->getDoctrine()->getRepository(Comment::class)->findBy(['post' => $idPost]);
        $countComments = count($comments);
        return $countComments;
    }

}
